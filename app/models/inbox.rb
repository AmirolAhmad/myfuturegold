class Inbox < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id

  acts_as_tree order: 'created_at DESC'

end
