class Game < ApplicationRecord
  belongs_to :user
  has_many :players, dependent: :destroy
  has_many :game_messages

  validates :name, :pg, :system, presence: :true
end
