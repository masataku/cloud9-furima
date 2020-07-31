class AddShippingMethodToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :shipping_method, :string
  end
end
