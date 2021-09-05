class UsersController < ApplicationController

  def index
    @book_new = Book.new
    @users = User.all
    @user = current_user
  end


  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end


  def edit
  end


  def update
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end
end
