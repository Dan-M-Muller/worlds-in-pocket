class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[accept destroy show]

  def index
    @users = User.all
    if params[:query].present?
      @users = User.search_users(params[:query])
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("friendship_modal", partial: "friendships/modal",
            locals: { users: @users })
        end
        format.html
      end
    end

    @pending = current_user.pending_friends
    @friends = current_user.friends
  end

  def create
    # raise
    # BUG: - friends_params não retorna nada - strong params: revisar pq não ta salvando
    @asker = current_user
    @receiver = User.find(params[:user_id])
    @friendship = Friendship.new()
    @friendship.asker = @asker
    @friendship.receiver = @receiver
    @friendship.save!
      # alerta de "convite enviado"
    redirect_to user_friendships_path(current_user)
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
    # raise
    redirect_to user_friendships_path(current_user)
  end

  private

  def set_friendship
    @friendship = Friendship.find(params[:id])
  end

  # def friend_params
  #   params.require(:friendship).permit(:asker_id, :receiver_id, :accepted)
  # end
end
