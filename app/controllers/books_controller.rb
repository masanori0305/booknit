class BooksController < ApplicationController
  # before_action :authenticate_user!, only: :new

  def index
    @books = Book.includes(:user).order("created_at DESC")
  end

  def search
  end

  def search_ajax

    require 'json'
    require 'net/https'

    app_id = '1094834126119853128'
    searchTitle = 'params[:text]'

    https = Net::HTTP.new('app.rakuten.co.jp', 443)
    https.use_ssl = true
    https.ca_file = 'nil'
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    https.verify_depth = 5

    https.start {
      response = https.get("/services/api/BooksBook/Search/20130522?format=json&applicationId=#{app_id}&title=#{searchTitle}")
      @document = JSON.parse(response.body);
    }

    respond_to do|format|
      format.html
      format.jason
    end
  end

  def new
  end

  def create
        Book.create(title: book_params[:title], auther: book_params[:auther], ganre: book_params[:ganre], image: book_params[:image],review: book_params[:review], user_id: current_user.id)
      redirect_to controller: :books, action: :index
  end

  def show
    @book = Book.find(params[:id])
    @comments = @book.comments.includes(:user)
  end



  private
    def book_params
      params.permit(:title, :auther, :ganre, :image, :review)
    end


end
