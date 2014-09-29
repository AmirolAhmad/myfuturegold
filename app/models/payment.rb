class Payment < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  belongs_to :order, foreign_key: :order_id
end
