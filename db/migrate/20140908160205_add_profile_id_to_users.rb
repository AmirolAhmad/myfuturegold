class AddProfileIdToUsers < ActiveRecord::Migration
  def up
    add_column :users, :profile_id, :integer unless column_exists? :users, :profile_id
  end

  def down
  	remove_column :users, :profile_id if column_exists? :users, :profile_id
  end
end
