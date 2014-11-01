class AddAdditionalInfoToProfile < ActiveRecord::Migration
  def up
    add_column :profiles, :address1, :string unless column_exists? :profiles, :address1
    add_column :profiles, :address2, :string unless column_exists? :profiles, :address2
    add_column :profiles, :city, :string unless column_exists? :profiles, :city
    add_column :profiles, :state, :string unless column_exists? :profiles, :state
    add_column :profiles, :postcode, :integer unless column_exists? :profiles, :postcode
    add_column :profiles, :country, :string unless column_exists? :profiles, :country

    add_column :profiles, :ic_num_heir1, :string unless column_exists? :profiles, :ic_num_heir1
    add_column :profiles, :heir1_address1, :string unless column_exists? :profiles, :heir1_address1
    add_column :profiles, :heir1_address2, :string unless column_exists? :profiles, :heir1_address2
    add_column :profiles, :heir1_city, :string unless column_exists? :profiles, :heir1_city
    add_column :profiles, :heir1_state, :string unless column_exists? :profiles, :heir1_state
    add_column :profiles, :heir1_postcode, :string unless column_exists? :profiles, :heir1_postcode
    add_column :profiles, :heir1_country, :string unless column_exists? :profiles, :heir1_country
    add_column :profiles, :heir1_email, :string unless column_exists? :profiles, :heir1_email
    add_column :profiles, :heir1_fb_id, :string unless column_exists? :profiles, :heir1_fb_id

    add_column :profiles, :heir2_name, :string unless column_exists? :profiles, :heir2_name
    add_column :profiles, :heir2_rel, :string unless column_exists? :profiles, :heir2_rel
    add_column :profiles, :heir2_phone_num, :string unless column_exists? :profiles, :heir2_phone_num
    add_column :profiles, :ic_num_heir2, :string unless column_exists? :profiles, :ic_num_heir2
    add_column :profiles, :heir2_address1, :string unless column_exists? :profiles, :heir2_address1
    add_column :profiles, :heir2_address2, :string unless column_exists? :profiles, :heir2_address2
    add_column :profiles, :heir2_city, :string unless column_exists? :profiles, :heir2_city
    add_column :profiles, :heir2_state, :string unless column_exists? :profiles, :heir2_state
    add_column :profiles, :heir2_postcode, :string unless column_exists? :profiles, :heir2_postcode
    add_column :profiles, :heir2_country, :string unless column_exists? :profiles, :heir2_country
    add_column :profiles, :heir2_email, :string unless column_exists? :profiles, :heir2_email
    add_column :profiles, :heir2_fb_id, :string unless column_exists? :profiles, :heir2_fb_id
  end

  def down
    
  end
end
