class UsersController < ApplicationController
  before_action :required_loggedin, only: [:show, :edit, :followings, :followers]

  def show
    @user = User.find(params[:id])
    @communities = @user.communities.order(created_at: :desc).page(params[:page])
    counts(@user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "新規登録が完了しました"
      redirect_to @user
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールを編集しました"
      redirect_to @user
    else
      flash[:danger] = "プロフィール編集に失敗しました"
      render :edit
    end
  end
  
  def new
    @user = User.new
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
    counts(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduction, :image)
  end
  
end
