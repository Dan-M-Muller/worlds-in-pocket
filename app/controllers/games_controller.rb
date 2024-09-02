class GamesController < ApplicationController
  before_action :set_game, only: %i[show]

  def show
    
    @player = Player.new
  end

  def new
    @game = Game.new()
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def game_params
    params.require(:game).permit(:name, :description, :system, :pg, :online?, :lfp?, :photo)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
