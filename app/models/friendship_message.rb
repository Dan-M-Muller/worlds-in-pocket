class FriendshipMessage < ApplicationRecord
  belongs_to :user
  belongs_to :friendship
  after_create_commit :broadcast_message

  def broadcast_message
    broadcast_append_to "friendship_#{friendship.id}_messages",
                        partial: "friendship_messages/message",
                        locals: { friendship_message: self, user: user },
                        target: "messages"
  end
end
