class CreatePaymentStatuses < ActiveRecord::Migration
  def up
    create_table :payment_statuses do |t|
      t.string :payment_status

      t.timestamps
    end unless table_exists? :payment_statuses
  end

  def down
    drop_table :payment_statuses if table_exists? :payment_statuses
  end
end
