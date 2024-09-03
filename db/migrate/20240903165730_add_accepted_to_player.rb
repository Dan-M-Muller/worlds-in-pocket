class AddAcceptedToPlayer < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :accepted, :boolean, default: false
  end
end
