class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], book_id: comment_params[:book_id], user_id: current_user.id)
    redirect_to "/books/#{@comment.book.id}"
  end

  private
  def comment_params
    params.permit(:text, :book_id)
  end
end
