class Order < ActiveRecord::Base
	belongs_to :user, foreign_key: :user_id
	belongs_to :discount, foreign_key: :discount_id
	belongs_to :package, foreign_key: :package_id
	belongs_to :status, foreign_key: :status_id

	#validates_presence_of :user_id
	validates_presence_of :discount_id
	validates_presence_of :package_id
	validates_presence_of :status_id
end
