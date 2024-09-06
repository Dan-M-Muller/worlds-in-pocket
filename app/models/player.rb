class Player < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :game_messages, dependent: :destroy

end
