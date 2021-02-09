class RemoveColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :buy_or_sold_time, :datetime
    
  end
end
