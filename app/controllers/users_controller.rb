class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @books = user.books.order("created_at DESC")
    userlikes = Like.where(user_id: user.id)

    userlikebook_id = userlikes.map {|userlike| userlike.book_id }
    @bookmarks = userlikebook_id.map {|ele| Book.find(ele)}

  end
end