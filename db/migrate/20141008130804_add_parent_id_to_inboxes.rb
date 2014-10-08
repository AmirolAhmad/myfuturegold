class AddParentIdToInboxes < ActiveRecord::Migration
  def change
    add_column :inboxes, :parent_id, :integer
  end
end
