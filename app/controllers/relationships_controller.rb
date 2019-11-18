class RelationshipsController < ApplicationController
  before_action :required_loggedin
  
  def create
    user = User.find(params[:follow_id])
    current_user.follow(user)
    flash[:success] = "フォローしました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = User.find(params[:follow_id])
    current_user.unfollow(user)
    flash[:success] = "フォローを解除しました"
    redirect_back(fallback_location: root_path)
  end
end
