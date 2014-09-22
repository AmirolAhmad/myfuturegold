class CreateDiscounts < ActiveRecord::Migration
  def up
    create_table :discounts do |t|
      t.datetime :discount_date
      t.string :discount_price

      t.timestamps
    end unless table_exists? :discounts
  end

  def down
    drop_table :discounts if table_exists? :discounts
  end
end
