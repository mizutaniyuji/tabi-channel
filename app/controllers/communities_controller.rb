class CommunitiesController < ApplicationController
  before_action :required_loggedin, only: [:index, :new]
  
  def index
    @communities = Community.order(created_at: :desc).page(params[:page])
  end
  
  def show
    @community = Community.find(params[:id])
    @message = @community.messages.build
    @message.user_id = current_user.id
    
    @messages = @community.messages.order(created_at: :desc).page(params[:page])
  end
  
  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.creater_name = current_user.name
    if @community.save
      flash[:success] = "新しいコミュニティの作成に成功しました"
      redirect_to communities_path
    else
      flash[:danger] = "コミュニティの作成に失敗しました"
      render communities_path
    end
  end

  
  private
  
  def community_params
    params.require(:community).permit(:title, :area)
  end
  
end
