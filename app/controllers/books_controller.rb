class BooksController < ApplicationController

  def new
    @book = Book.new
  end


  def create
    @book = Book.new(params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end


  def index
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
