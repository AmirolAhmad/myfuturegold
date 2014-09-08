class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :nama_penuh
      t.string :tel_num
      t.string :facebook_id
      t.string :nama_waris
      t.string :hub_waris
      t.string :tel_num_waris
      t.string :nama_bank
      t.string :nama_akaun
      t.string :no_akaun

      t.timestamps
    end
  end
end
