class CreateAssistants < ActiveRecord::Migration[7.1]
  def change
    create_table :assistants do |t|

      t.timestamps
    end
  end
end
