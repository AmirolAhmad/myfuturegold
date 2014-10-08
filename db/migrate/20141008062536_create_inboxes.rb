class CreateInboxes < ActiveRecord::Migration
  def up
    create_table :inboxes do |t|
      t.integer :user_id
      t.string :ticket_id
      t.text :subject
      t.text :description
      t.string :status
      t.string :category

      t.timestamps
    end
  end

  def down
    drop_table :inboxes if table_exists? :inboxes
  end
end
