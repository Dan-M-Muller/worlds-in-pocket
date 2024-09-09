class AddColumnsToAssistant < ActiveRecord::Migration[7.1]
  def change
    add_column :assistants, :question, :text
    add_column :assistants, :answer, :text
    add_reference :assistants, :user, foreign_key: true
  end
end
