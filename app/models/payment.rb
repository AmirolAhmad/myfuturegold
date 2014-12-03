class Payment < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader

  belongs_to :user, foreign_key: :user_id
  belongs_to :order, foreign_key: :order_id

  validates :total_payment, numericality: { only_integer: true }
  validates_presence_of :method
  validates_presence_of :attachment
  validates_presence_of :payment_date
  validates_presence_of :payment_time
  validates_presence_of :total_payment

  default_scope -> { order('payments.created_at DESC') }

  def self.total_on(date)
    where("date(created_at) = ?", date).sum(:total_payment)
  end
end
