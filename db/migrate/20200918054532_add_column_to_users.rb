class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_reading, :string
    add_column :users, :last_reading, :string
    add_column :users, :postal_code, :integer
    add_column :users, :prefecture, :string
    add_column :users, :municipality, :string
    add_column :users, :address, :string
    add_column :users, :building_name, :string
    add_column :users, :phone_number, :integer
  end
end
