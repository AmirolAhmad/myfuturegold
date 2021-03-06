class Status < ActiveRecord::Base
	has_many :orders, dependent: :destroy

  accepts_nested_attributes_for :orders, allow_destroy: true
end
