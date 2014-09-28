class Order < ActiveRecord::Base

  extend FriendlyId #https://github.com/norman/friendly_id

  friendly_id :ref_number, use: [:slugged, :finders, :history]

  belongs_to :user, foreign_key: :user_id
  belongs_to :discount, foreign_key: :discount_id
  belongs_to :package, foreign_key: :package_id
  belongs_to :status, foreign_key: :status_id
  belongs_to :payment_status, foreign_key: :payment_status_id

  #validates_presence_of :user_id
  validates_presence_of :discount_id
  validates_presence_of :package_id
  validates_presence_of :status_id
  validates_presence_of :payment_status_id

  default_scope -> { order('orders.created_at DESC') }
end
