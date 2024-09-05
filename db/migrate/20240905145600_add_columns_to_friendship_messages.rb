class AddColumnsToFriendshipMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :friendship_messages, :content, :text
    add_reference :friendship_messages, :user, foreign_key: true
    add_reference :friendship_messages, :friendships, foreign_key: true
  end
end
