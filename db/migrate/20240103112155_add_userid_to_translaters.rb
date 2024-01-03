class AddUseridToTranslaters < ActiveRecord::Migration[7.0]
  def change
    add_column :translaters, :user_id, :integer, default: 0    
  end
end
