class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable;

  has_many :games, dependent: :destroy
  has_many :players, dependent: :destroy
  has_many :friendships_as_asker, class_name: "Friendship", foreign_key: :asker_id, dependent: :destroy
  has_many :friendships_as_receiver, class_name: "Friendship", foreign_key: :receiver_id, dependent: :destroy

  validates :first_name, :last_name, :nick_name, :age, presence: :true

  def pending_players
    players.where(accepted: false)
  end

  def pending?
    pending_players.count.positive?
  end

  def pending_friends
    receiver.where(accepted: false)
  end

  def requests?
    pending_friends.count.positive?
  end
end
