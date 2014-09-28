class AddSlugToOrders < ActiveRecord::Migration
  def up
    add_column :orders, :slug, :string unless column_exists? :orders, :slug
  end

  def down
    remove_column :orders, :slug if column_exists? :orders, :slug
  end
end
