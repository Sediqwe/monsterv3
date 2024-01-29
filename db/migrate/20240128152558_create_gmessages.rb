class CreateGmessages < ActiveRecord::Migration[7.0]
  def change
    create_table :gmessages do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.references :game, null: false, foreign_key: true
      t.references :gmessage, null: true, foreign_key: true
      t.boolean :warn
      t.references :senduser, null: true, foreign_key: { to_table: :users, to_column: :id } 
      t.timestamps
    end
  end
end
