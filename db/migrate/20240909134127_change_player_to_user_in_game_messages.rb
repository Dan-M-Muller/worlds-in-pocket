class ChangePlayerToUserInGameMessages < ActiveRecord::Migration[7.1]
  def change
    remove_column :game_messages, :player_id
    add_reference :game_messages, :user, foreign_key: true
  end
end
