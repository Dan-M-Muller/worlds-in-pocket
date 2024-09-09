class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable;

  has_many :games, dependent: :destroy
  has_many :players, dependent: :destroy
  has_many :friendships_as_asker, class_name: "Friendship", foreign_key: :asker_id, dependent: :destroy
  has_many :friendships_as_receiver, class_name: "Friendship", foreign_key: :receiver_id, dependent: :destroy
  has_many :friendship_messages, dependent: :destroy
  has_many :game_messages, dependent: :destroy
  has_many :assistants, dependent: :destroy
  has_one_attached :photo

  validates :first_name, :last_name, :nick_name, :age, presence: :true

  include PgSearch::Model
  pg_search_scope :search_users,
    against: [ :email, :nick_name ],
    using: {
      tsearch: { prefix: true }
    }

  def pending_players
    players.where(accepted: false)
  end

  def pending?
    pending_players.count.positive?
  end

  def pending_friends
    friendships_as_asker.where(accepted: false)
  end

  def requests
    friendships_as_receiver.where(accepted: false)
  end

  def requests?
    requests.count.positive?
  end

  def friends
    friendships = Friendship.all
    @map = []
    friendships.map do |f|
      if f.accepted == true
        @map << f
      end
    end
    return @map
  end

  # def is_asker?
  #   self.id == asker.id
  # end
end
