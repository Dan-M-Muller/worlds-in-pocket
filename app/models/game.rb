class Game < ApplicationRecord
  belongs_to :user
  has_many :players, dependent: :destroy
  has_many :game_messages, dependent: :destroy
  has_one_attached :photo

  validates :name, :pg, :system, presence: :true

  after_create_commit :add_user_to_player

  private
  def add_user_to_player
    Player.create!(user: user, game: self, accepted: true)
  end
end
