class Profile < ActiveRecord::Base
	belongs_to :user, foreign_key: :user_id

	validates_presence_of :user_id
	# validates_presence_of :nama_penuh
	# validates_presence_of :ic_number
	# validates_presence_of :tel_num
	# validates_presence_of :facebook_id
	# validates_presence_of :nama_waris
	# validates_presence_of :hub_waris
	# validates_presence_of :tel_num_waris
	# validates_presence_of :nama_bank
	# validates_presence_of :nama_akaun
	validates 			:facebook_id, format: { with: /\A[-\w.]*\z/ }, allow_blank: true
	validates 			:heir1_fb_id, format: { with: /\A[-\w.]*\z/ }, allow_blank: true
	validates 			:heir2_fb_id, format: { with: /\A[-\w.]*\z/ }, allow_blank: true
	validates_numericality_of :no_akaun, allow_blank: true, :only_integer => true, :message => 'should only contain numbers.'
	validates_numericality_of :postcode, length: { is: 5 }, allow_blank: true, :only_integer => true, :message => 'should only contain numbers.'
	validates_numericality_of :heir1_postcode, length: { is: 5 }, allow_blank: true, :only_integer => true, :message => 'should only contain numbers.'
	validates_numericality_of :heir2_postcode, length: { is: 5 }, allow_blank: true, :only_integer => true, :message => 'should only contain numbers.'
	validates 			:ic_number, length: { is: 12 }, :numericality => true, allow_blank: true
	validates 			:ic_num_heir1, length: { is: 12 }, :numericality => true, allow_blank: true
	validates 			:ic_num_heir2, length: { is: 12 }, :numericality => true, allow_blank: true
	validates           :tel_num, length: { in: 8..15 }, format: { with: /\A0[0-9\-\+ \/]*\z/ }, allow_blank: true, :numericality => true
	validates           :tel_num_waris, length: { in: 8..15 }, format: { with: /\A0[0-9\-\+ \/]*\z/ }, allow_blank: true, :numericality => true
	validates           :heir2_phone_num, length: { in: 8..15 }, format: { with: /\A0[0-9\-\+ \/]*\z/ }, allow_blank: true, :numericality => true
	
end
