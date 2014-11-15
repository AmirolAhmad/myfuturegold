class Item < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  belongs_to :order, foreign_key: :order_id

  validates :gram_received, numericality: { only_integer: true }

  default_scope -> { order('items.created_at DESC') }
end
