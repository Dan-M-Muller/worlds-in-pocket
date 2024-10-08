class ProfilesController < ApplicationController
  def show
    @user = current_user
    @plays = []
    @user.players.each do |p|
      @plays << p.game
    end
    # raise
    return @plays
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to profile_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:nick_name, :email, :password, :photo)
  end
end
