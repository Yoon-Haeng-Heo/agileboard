class MessagesController < ApplicationController
  def create
    @conversation = Conversation.includes(:project).find(params[:conversation_id])
    @message = @conversation.messages.create(message_params)

    respond_to do |format|
        format.js
    end
  end
  
  private
  
  def message_params
    params[:message][:user_id] = current_user.id
    params.require(:message).permit(:user_id, :body)
  end
end
