class Voucher < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  belongs_to :order, foreign_key: :order_id

  def self.total_on(date)
    where("date(created_at) = ?", date).sum(:total_payment)
  end
end
