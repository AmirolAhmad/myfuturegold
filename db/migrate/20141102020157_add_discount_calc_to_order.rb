class AddDiscountCalcToOrder < ActiveRecord::Migration
  def up
    add_column :orders, :discount_per_gram, :integer, null: true unless column_exists? :orders, :discount_per_gram
    add_column :orders, :total_discount, :integer, null: true unless column_exists? :orders, :total_discount
  end

  def down
  end
end
