class AddSlugToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :slug, :text 
  end
end
