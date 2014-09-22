class CreateStatuses < ActiveRecord::Migration
  def up
    create_table :statuses do |t|
      t.string :status_name

      t.timestamps
    end unless table_exists? :statuses
  end

  def down
    drop_table :statuses if table_exists? :statuses
  end
end
