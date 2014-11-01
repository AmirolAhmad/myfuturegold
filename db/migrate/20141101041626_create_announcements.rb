class CreateAnnouncements < ActiveRecord::Migration
  def up
    create_table :announcements do |t|
      t.integer :user_id, null: false
      t.text :subject, null: false
      t.text :description, null: false

      t.timestamps
    end
  end

  def down
    drop_table :announcements if table_exists? :announcements
  end
end
