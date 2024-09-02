class Game < ApplicationRecord
  belongs_to :user
  has_many :players, dependent: :destroy

  validates :name, :pg, :system, presence: :true
end
