class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :text
      t.integer :price
      t.string :image
      t.string :state
      t.string :region
      t.integer :shipping_date
      t.integer :saler_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
