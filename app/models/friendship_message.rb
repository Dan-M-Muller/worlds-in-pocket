class FriendshipMessage < ApplicationRecord
  belongs_to :user
  belongs_to :friendship
end
