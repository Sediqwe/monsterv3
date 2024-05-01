class CreateLinktypes < ActiveRecord::Migration[7.1]
  def change
    create_table :linktypes do |t|
      t.string :name
      t.text :icon

      t.timestamps
    end
  end
end
