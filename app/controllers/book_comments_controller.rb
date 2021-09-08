class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment =  current_user.book_commnets.new(book_commnet_params)
    comment.book_id = book.id
    comment.save
    redirect_to  book_path(book)
  end


  def destroy
  end


  private

  def book_comment_params
    params.repuire(:book_comment).permit(:comment)
  end
end
