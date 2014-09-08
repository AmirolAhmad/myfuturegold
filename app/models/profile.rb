class Profile < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :nama_penuh
	validates           :tel_num, length: { in: 8..15 }, format: { with: /^[0-9\-\+ \/]*$/ }, allow_blank: true
	validates_presence_of :facebook_id
	validates_presence_of :nama_waris
	validates_presence_of :hub_waris
	validates           :tel_num_waris, length: { in: 8..15 }, format: { with: /^[0-9\-\+ \/]*$/ }, allow_blank: true
	validates_presence_of :nama_bank
	validates_presence_of :nama_akaun
	validates_numericality_of :no_akaun, allow_blank: true, :only_integer => true, :message => 'should only contain numbers.'
	
end
