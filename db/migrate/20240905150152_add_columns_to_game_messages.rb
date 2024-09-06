class AddColumnsToGameMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :game_messages, :content, :text
    add_reference :game_messages, :game, foreign_key: true
    add_reference :game_messages, :player, foreign_key: true
  end
end
