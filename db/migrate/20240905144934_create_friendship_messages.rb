class CreateFriendshipMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :friendship_messages do |t|

      t.timestamps
    end
  end
end
