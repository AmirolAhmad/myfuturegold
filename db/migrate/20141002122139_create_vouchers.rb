class CreateVouchers < ActiveRecord::Migration
  def up
    create_table :vouchers do |t|
      t.integer :user_id, null: false
      t.integer :order_id, null: false
      t.string :voucher_date
      t.string :method
      t.string :status
      t.string :total_payment
      t.string :receipt_number

      t.timestamps
    end
  end

  def down
    drop_table :vouchers if table_exists? :vouchers
  end
end
