class FriendshipMessagesController < ApplicationController

  def create
    @friendship = Friendship.find(params[:friendship_id])
    @message = FriendshipMessage.new(message_params)
    @message.friendship = @friendship
    @message.user = current_user
    if @message.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:messages, partial: "friendship_messages/message",
            locals: { friendship_message: @message, user: current_user })
        end
        format.html { redirect_to friendship_path(@friendship) }
      end
      @notification = Notification.create(friendship_message: @message)
    else
      render "friendships/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:friendship_message).permit(:content)
  end
end
