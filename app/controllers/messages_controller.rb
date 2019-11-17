class MessagesController < ApplicationController
  before_action :required_loggedin
  
  def create
    @community = Community.find(params[:community_id])
    @message = @community.messages.build(message_params)
    @message.creater_name = current_user.name
    @message.user_id = current_user.id
    
    if @message.save
      flash[:success] = "メッセージを投稿しました"
      redirect_to community_path(@community)
    else
      flash.now[:danger] = "投稿に失敗しました"
      render community_path(@community)
    end
  end

  
  private
  
  def message_params
    params.require(:message).permit(:content)
  end
  
  def correct_user
    @message = Message.find(params[:id])
    @community = @message.community
    @message_test = current_user.messages.find_by(id: params[:id])
    unless @message_test
      redirect_to @community
    end
  end
  
end
