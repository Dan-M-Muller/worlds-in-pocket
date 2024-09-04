class FriendshipsController < ApplicationController

  def index
    @users = User.all
    if params[:query].present?
      @users = User.search_users(params[:query])
    end

    @pending = current_user.pending_friends
    @friends = current_user.friends
    # raise
  end

  def create
    # strong params: revisar pq não ta salvando
    @asker = current_user
    @receiver = User.find(params[:user_id])
    @friendship = Friendship.new()
    @friendship.asker = @asker
    @friendship.receiver = @receiver
    if @friendship.save
      # raise
      # alerta de "convite enviado"
      redirect_back fallback_location: '/'
    end
  end

  private


  # def friend_params
  #   params.require(:friendship).permit(:asker_id, :receiver_id, :accepted)
  # end
end
