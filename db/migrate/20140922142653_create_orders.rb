class CreateOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.integer :user_id
      t.integer :package_id
      t.integer :discount_id
      t.integer :status_id

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
