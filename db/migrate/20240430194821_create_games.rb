class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :name
      t.boolean :active
      t.boolean :reserved
      t.boolean :hidden
      t.datetime :reservedtime

      t.timestamps
    end
  end
end
