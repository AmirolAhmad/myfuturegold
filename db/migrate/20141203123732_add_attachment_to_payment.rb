class AddAttachmentToPayment < ActiveRecord::Migration
  def up
    add_column :payments, :attachment, :string unless column_exists? :payments, :attachment
  end

  def down
    remove_column :payments, :attachment if column_exists? :payments, :attachment
  end
end
