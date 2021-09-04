class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end


  def create
    @book = Book.new(params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end


  def show
  end


  def edit
  end


  def update
  end


  def destroy
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
