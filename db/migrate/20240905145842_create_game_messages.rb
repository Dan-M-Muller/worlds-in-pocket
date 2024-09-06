class CreateGameMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :game_messages do |t|

      t.timestamps
    end
  end
end
