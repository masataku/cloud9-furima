class CreateComment < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false

      t.timestamps
    end
  end
end
