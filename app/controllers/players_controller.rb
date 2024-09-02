class PlayersController < ApplicationController

  def create
    # raise
    @game = Game.find(params[:game_id])
    @player = Player.new(player_params)
    @player.game = @game

    if @player.save
      redirect_to game_path(@game)
    end
  end


  private

  def player_params
    params.require(:player).permit(:user_id, :game_id)
  end
end
