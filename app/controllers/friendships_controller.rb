class FriendshipsController < ApplicationController

  def index
    @freinds = Friendship.all
  end
end
