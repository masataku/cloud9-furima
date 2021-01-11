class CreateNotification < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :comment_id
      t.string :action
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
