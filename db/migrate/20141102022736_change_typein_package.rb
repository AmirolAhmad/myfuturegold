class ChangeTypeinPackage < ActiveRecord::Migration
  def up
  	change_column :packages, :selling_price, :integer
  	change_column :packages, :buying_price, :integer
  end

  def down
  	change_column :packages, :selling_price, :string
  	change_column :packages, :buying_price, :string
  end
end
