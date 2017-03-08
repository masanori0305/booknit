class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, book_id: params[:book_id])
    @book = Book.includes(:user).find(params[:book_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, book_id: params[:book_id])
    like.destroy
    @book = Book.includes(:user).find(params[:book_id])
  end
end

