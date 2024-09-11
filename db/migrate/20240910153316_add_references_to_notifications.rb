class AddReferencesToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_reference :notifications, :friendship_message, foreign_key: true
    add_reference :notifications, :game_message, foreign_key: true
    add_reference :notifications, :friendship, foreign_key: true
    add_reference :notifications, :player, foreign_key: true
  end
end
