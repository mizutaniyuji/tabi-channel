class UsersController < ApplicationController
  before_action :required_loggedin, only: [:show, :edit]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def create
  end

  def update
  end
  
  def new
    @user = User.new
  end
end
