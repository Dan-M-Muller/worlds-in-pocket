class Game < ApplicationRecord
  validates :name, :pg, :system, :online?, :lfp?, presence: :true
end
