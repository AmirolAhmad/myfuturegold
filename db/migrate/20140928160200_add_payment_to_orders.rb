class AddPaymentToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment_date, :string, null: false
    add_column :orders, :payment_receipt_number, :string, null: false
    add_column :orders, :payment_status_id, :integer, null: false
    add_column :orders, :payment_method, :string, null: false
  end
end
