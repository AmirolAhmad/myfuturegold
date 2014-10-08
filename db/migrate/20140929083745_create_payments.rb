class CreatePayments < ActiveRecord::Migration
  def up
    create_table :payments do |t|
      t.integer :user_id, null: false
      t.integer :order_id, null: false
      t.string :payment_date
      t.string :method
      t.string :status
      t.string :total_payment
      t.string :receipt_number

      t.timestamps
    end
  end

  def down
    drop_table :payments if table_exists? :payments
  end
end
