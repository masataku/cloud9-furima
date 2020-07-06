class ChangeShippingDateToItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :shipping_date
    
    add_column :items, :shipping_date, :string
  end
end
