class AddShippingChargeToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :shipping_charge, :string
  end
end
