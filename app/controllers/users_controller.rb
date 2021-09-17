class UsersController < ApplicationController

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end


  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end


  def edit
    @user = User.find(params[:id])
    if @user.email == 'guest@example.com'
      redirect_to user_path(current_user)
    elsif @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end


  # ゲストログイン
  def new_guest
    # emailでユーザーが見つからなければ作ってくれるという便利なメソッド
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
    # 自分はユーザー登録時にニックネームを必須にしているのでこの記述が必要
    user.name = "ゲスト"
    # 英数字混合を必須にしているので、ランダムパスワードに、英字と数字を追加してバリデーションに引っかからないようにしています。
    user.password = SecureRandom.alphanumeric(10) + [*'a'..'z'].sample(1).join + [*'0'..'9'].sample(1).join
    end
    # sign_inはログイン状態にするデバイスのメソッド
    sign_in user
    # ログイン後root_pathに飛ぶようにしました。
    redirect_to users_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
