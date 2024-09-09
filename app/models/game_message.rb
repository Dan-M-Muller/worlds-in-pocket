class GameMessage < ApplicationRecord
  belongs_to :user
  belongs_to :game
  after_create_commit :broadcast_message

  def broadcast_message
    broadcast_append_to "game_#{game.id}_messages",
                        partial: "game_messages/message",
                        locals: { game_message: self, user: user },
                        target: "g-messages"
  end
end
