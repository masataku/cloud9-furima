class AddTradingToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :tradind, :string
  end
end
