class UsersController < ApplicationController
  before_action :required_loggedin, only: [:show, :edit]

  def show
    @user = User.find(params[:id])
  end

  def edit
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
  end
  
  def new
    @user = User.new
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
