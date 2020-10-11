class RemoveColumnWhichSoldItemIdToItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :which_sold_item_id, :integer
  end
end
