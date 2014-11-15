class AddItemTypeToItems < ActiveRecord::Migration
  def up
    add_column :items, :item_type, :string unless column_exists? :items, :item_type
  end

  def down
    remove_column :items, :item_type if column_exists? :items, :item_type
  end
end
