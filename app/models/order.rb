class Order < ActiveRecord::Base

  extend FriendlyId #https://github.com/norman/friendly_id

  friendly_id :ref_number, use: [:slugged, :finders, :history]

  belongs_to :user, foreign_key: :user_id
  belongs_to :discount, foreign_key: :discount_id
  belongs_to :package, foreign_key: :package_id
  belongs_to :status, foreign_key: :status_id
  has_many :payments, dependent: :destroy
  has_many :vouchers, dependent: :destroy

  #validates_presence_of :user_id
  validates_presence_of :discount_id
  validates_presence_of :package_id
  validates_presence_of :status_id

  validates :gram_quantity, numericality: { only_integer: true }
  # validates :restock, numericality: {
  #                                   only_integer: true,
  #                                   :greater_than_or_equal_to => 1,
  #                                   :less_than_or_equal_to => 36
  #                                 }

  default_scope -> { order('orders.created_at DESC') }

  def self.total_on(date)
    where(["date(ordered_date) = ?", date]).sum(:total_price)
  end
end
