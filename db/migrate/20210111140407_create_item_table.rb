class CreateItemTable < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :text
      t.integer :price
      t.string :image
      t.string :state
      t.string :region
      t.integer :saler_id
      t.integer :buyer_id
      t.string :shipping_date
      t.string :shipping_method
      t.string :shipping_charge
      t.datetime :buy_or_sold_time
      t.string :which_sold_item
      t.string :tradind
      
      t.timestamps
    end
  end
end
