class AddUnreadToInbox < ActiveRecord::Migration
  def up
    add_column :inboxes, :unread, :boolean, :default => false unless column_exists? :inboxes, :unread
  end

  def down
    remove_column :inboxes, :unread if column_exists? :inboxes, :unread
  end
end
