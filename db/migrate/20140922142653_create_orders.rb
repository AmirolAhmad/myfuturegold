class CreateOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.integer :package_id, null: false
      t.integer :discount_id, null: false
      t.integer :status_id, null: false

      t.string :gram_quantity
      t.string :price
      t.string :total_price
      t.string :ref_number
      t.datetime :ordered_date

      t.timestamps
    end unless table_exists? :orders
  end

  def down
    drop_table :orders if table_exists? :orders
  end
end
