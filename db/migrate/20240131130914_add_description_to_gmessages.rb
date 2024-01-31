class AddDescriptionToGmessages < ActiveRecord::Migration[7.0]
  def change
    add_column :gmessages, :description, :text
  end
end
