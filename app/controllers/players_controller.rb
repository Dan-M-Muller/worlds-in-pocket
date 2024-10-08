class PlayersController < ApplicationController
  before_action :set_player, only: %i[destroy accept]
  def create
    # raise
    @game = Game.find(params[:game_id])
    @player = Player.new(player_params)
    @player.game = @game

    if @player.save
      redirect_to game_path(@game)
    end
  end

  def pending
    @players = current_user.pending_players
    @friends = current_user.requests
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
  end


  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:user_id, :game_id)
  end
end
