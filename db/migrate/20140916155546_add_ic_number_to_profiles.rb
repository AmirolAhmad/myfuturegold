class AddIcNumberToProfiles < ActiveRecord::Migration
  def up
    add_column :profiles, :ic_number, :string unless column_exists? :profiles, :ic_number
  end

  def down
    remove_column :profiles, :ic_number if column_exists? :profiles, :ic_number
  end
end
