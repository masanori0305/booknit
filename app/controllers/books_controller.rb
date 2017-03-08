require 'json'
require 'net/https'

class BooksController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @books = Book.includes(:user).order("created_at DESC").page(params[:page]).per(10)
    @likes = Like.where(user_id: current_user)
  end

  def search
    if params[:keyword].present?
      app_id = '1094834126119853128'
      searchTitle = params[:keyword]

      https = Net::HTTP.new('app.rakuten.co.jp', 443)
      https.use_ssl = true
      https.ca_file = 'nil'
      https.verify_mode = OpenSSL::SSL::VERIFY_NONE
      https.verify_depth = 5

      https.start {
        response = https.get("/services/api/BooksBook/Search/20130522?format=json&applicationId=#{app_id}&title=#{searchTitle}")
        document = JSON.parse(response.body);
        @items = document["Items"] || []
      }
    end
  end

  def new
    @title = params[:title]
    @author = params[:author]
    @book_image = params[:book_image]
    @publisher = params[:publisher]
  end

  def create
        Book.create(title: book_params[:title], author: book_params[:auther], publisher: book_params[:publisher], image: book_params[:image],review: book_params[:review], rate: book_params[:rate], user_id: current_user.id)
      redirect_to controller: :books, action: :index
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy if book.user_id == current_user.id
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      book = Book.find(params[:id])
      if book.user_id == current_user.id
        book.update(book_params)
      end
  end

  def show
    @book = Book.find(params[:id])
    @comments = @book.comments.includes(:user)
  end



  private
    def book_params
      params.permit(:title, :author, :publisher, :image, :review, :rate)
    end


end
