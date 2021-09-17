class GroupsController < ApplicationController

  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @book = Book.new
    @groups = Group.all
  end


  def show
    @book = Book.new
    @group = Group.find(params[:id])
  end


  def join
    @group = Group.find(params[:group_id])
    # @group.usersに,current_userを追加しているということ
    @group.users << current_user
    redirect_to groups_path
  end


  def new
    @group = Group.new
  end


  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.users << current_user
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end


  def edit
  end


  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end


  def destroy
    @group = Group.find(params[:id])
    # current_userは、@group.usersから消されるという記述
    @group.users.destroy(current_user)
    redirect_to groups_path
  end


  def all_destroy
    @group = Group.find(params[:group_id])
    if @group.destroy
      redirect_to groups_path
    end
  end

  # メールのための記述
  def new_mail
    @group = Group.find(params[:group_id])
  end


  def send_mail
    @group = Group.find(params[:group_id])
    group_users = @group.users
    @mail_title = params[:mail_title]
    @mail_content = params[:mail_content]
    ContactMailer.send_mail(@mail_title, @mail_content, group_users).deliver
  end


  private


  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end


  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end
end
