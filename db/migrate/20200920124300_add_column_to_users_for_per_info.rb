class AddColumnToUsersForPerInfo < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :real_name, :string
    add_column :users, :real_reading, :string
    add_column :users, :birthday, :string
    add_column :users, :real_postal_code, :integer
    add_column :users, :real_prefecture, :string
    add_column :users, :real_municipality, :string
    add_column :users, :real_address, :string
    add_column :users, :real_building_name, :string
  end
end
