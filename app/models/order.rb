class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :discount
	belongs_to :package
	belongs_to :status
end
