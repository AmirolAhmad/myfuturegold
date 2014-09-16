class Profile < ActiveRecord::Base
	belongs_to :user, foreign_key: :user_id

	acts_as_paranoid

	validates_presence_of :user_id
	# validates_presence_of :nama_penuh
	# validates_presence_of :tel_num
	# validates_presence_of :facebook_id
	# validates_presence_of :nama_waris
	# validates_presence_of :hub_waris
	# validates_presence_of :tel_num_waris
	# validates_presence_of :nama_bank
	# validates_presence_of :nama_akaun
	validates_numericality_of :no_akaun, allow_blank: true, :only_integer => true, :message => 'should only contain numbers.'
	validates           :tel_num, length: { in: 8..15 }, format: { with: /\A[0-9\-\+ \/]*\z/ }, allow_blank: true
	validates           :tel_num_waris, length: { in: 8..15 }, format: { with: /\A[0-9\-\+ \/]*\z/ }, allow_blank: true
	
end
