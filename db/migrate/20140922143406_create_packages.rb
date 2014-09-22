class CreatePackages < ActiveRecord::Migration
  def up
    create_table :packages do |t|
      t.string :package_name
      t.string :selling_price
      t.string :buying_price
      t.string :price
      t.string :term_contract

      t.timestamps
    end unless table_exists? :packages
  end

  def down
    drop_table :packages if table_exists? :packages
  end
end
