class AddStatusToItems < ActiveRecord::Migration
  def up
    add_column :items, :status, :string unless column_exists? :items, :status
  end

  def down
    remove_column :items, :status if column_exists? :items, :status
  end
end
