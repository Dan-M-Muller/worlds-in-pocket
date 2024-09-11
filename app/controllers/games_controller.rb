class GamesController < ApplicationController
  before_action :set_game, only: %i[show chat]

  def index
    @games = Game.all
  end

  def show
    @player = Player.new
    @game_players = []
    @game.players.each do |p|
      @game_players << p.user_id
    end
    # raise
    return @game_players
  end

  def new
    @game = Game.new()
  end

  def chat
    @game_message = GameMessage.new
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

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)

    redirect_to game_path(@game)
  end
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path, status: :see_other
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :system, :pg, :online?, :lfp?, :photo)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
