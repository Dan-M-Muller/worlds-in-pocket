class Game < ApplicationRecord
  validates :name, :pg, :system, presence: :true
  belongs_to :user
  has_many :players, dependent: :destroy

end
