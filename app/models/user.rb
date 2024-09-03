class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable;

  has_many :games, dependent: :destroy
  has_many :players, dependent: :destroy

  validates :first_name, :last_name, :nick_name, :age, presence: :true

  def pending_players
    players.where(accepted: false)
  end

  def pending?
    pending_players.count.positive?
  end
end
