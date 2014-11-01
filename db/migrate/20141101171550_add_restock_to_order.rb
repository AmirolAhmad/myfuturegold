class AddRestockToOrder < ActiveRecord::Migration
  def up
    add_column :orders, :restock, :integer, null: true unless column_exists? :orders, :restock
  end

  def down
    remove_column :orders, :restock if column_exists? :orders, :restock
  end
end
