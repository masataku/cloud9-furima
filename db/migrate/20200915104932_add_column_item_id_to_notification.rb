class AddColumnItemIdToNotification < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :item_id, :integer 
  end
end
