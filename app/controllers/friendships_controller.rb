class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[accept destroy show]

  def index
    @users = User.all
    if params[:query].present?
      @users = User.search_users(params[:query])
    end

    @pending = current_user.pending_friends
    @friends = current_user.friends
    
  end

  def create
    # BUG: - friends_params não retorna nada - strong params: revisar pq não ta salvando
    @asker = current_user
    @receiver = User.find(params[:user_id])
    @friendship = Friendship.new()
    @friendship.asker = @asker
    @friendship.receiver = @receiver
    if @friendship.save
      # alerta de "convite enviado"
      redirect_back fallback_location: '/'
    end
  end

  def show
    @friendship_message = FriendshipMessage.new
  end

  def accept
    @friendship.accepted = true
    @friendship.save
    redirect_to pending_players_path
  end

  def destroy
    @friendship.destroy
    redirect_back fallback_location: '/'
  end



  private

  def set_friendship
    @friendship = Friendship.find(params[:id])
  end

  # def friend_params
  #   params.require(:friendship).permit(:asker_id, :receiver_id, :accepted)
  # end
end
