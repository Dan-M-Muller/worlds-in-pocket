class FriendshipsController < ApplicationController

  def index
    @users = User.all

  end

  def create
  end
end
