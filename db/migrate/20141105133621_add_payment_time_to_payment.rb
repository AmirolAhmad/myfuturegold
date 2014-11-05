class AddPaymentTimeToPayment < ActiveRecord::Migration
  def up
    add_column :payments, :payment_time, :string unless column_exists? :payments, :payment_time
  end

  def down
    remove_column :payments, :payment_time if column_exists? :payments, :payment_time
  end
end
