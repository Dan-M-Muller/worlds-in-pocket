class AddColumnsToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :name, :string
    add_column :games, :description, :string
    add_column :games, :system, :string
    add_column :games, :online?, :boolean
    add_column :games, :pg, :integer
    add_column :games, :lfp?, :boolean
  end
end
