class PlayersController < ApplicationController
  before_action :set_player, only: %i[destroy accept]
  def create
    # raise
    @game = Game.find(params[:game_id])
    @player = Player.new(player_params)
    @player.game = @game
    # @player.accepted = false

    if @player.save
      redirect_to game_path(@game)
    end
  end

  def pending
    @players = current_user.pending_players
  end

  def accept
    @player.accepted = true
    @player.save
    redirect_to pending_players_path
  end

  def destroy
    @game = @player.game
    @player.destroy
    redirect_back fallback_location: '/'
    # redirect_to game_path(@game), status: :see_other
  end


  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:user_id, :game_id)
  end
end
