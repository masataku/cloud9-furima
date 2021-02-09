class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :buyed_or_sold_time, :datetime
  end
end
