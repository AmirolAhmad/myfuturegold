class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  acts_as_paranoid
  
  extend FriendlyId #https://github.com/norman/friendly_id

  friendly_id :login, use: [:slugged, :finders, :history]

  has_one :profile, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :vouchers, dependent: :destroy
  has_many :inboxes, dependent: :destroy
  has_many :announcements, dependent: :destroy
    
	accepts_nested_attributes_for :profile, update_only: true, allow_destroy: true

  validates :login, :uniqueness => { :case_sensitive => false }, format: { with: /\A[-\w.]*\z/ }

  scope :admin, -> { where(admin: true) }

  def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions).where(["lower(login) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	  else
	    where(conditions).first
	  end
	end
end
