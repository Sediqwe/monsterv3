class CreateGamelinks < ActiveRecord::Migration[7.1]
  def change
    create_table :gamelinks do |t|
      t.references :game, null: false, foreign_key: true
      t.string :link
      t.references :linktype, null: false, foreign_key: true

      t.timestamps
    end
  end
end
