class Inbox < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
end
