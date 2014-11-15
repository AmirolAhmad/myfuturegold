class CreateItems < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.integer :user_id, null: false
      t.integer :order_id, null: false
      t.string :gram_received
      t.string :date_received
      t.string :receipt_number

      t.timestamps
    end
  end

  def down
    drop_table :items if table_exists? :items
  end
end
