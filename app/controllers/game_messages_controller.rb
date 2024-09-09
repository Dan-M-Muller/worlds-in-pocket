class GameMessagesController < ApplicationController

  def create
    @game = Game.find(params[:id])
    @message = GameMessage.new(message_params)
    @message.game = @game
    @message.user = current_user
    if @message.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:messages, partial: "game_messages/message",
            locals: {game_message: @message, user:current_user})
        end
        format.html {redirect_to chat_game_path(@game)}
      end
    else
      render "games/chat", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:game_message).permit(:content)
  end
end
