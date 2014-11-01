class Announcement < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id

  default_scope -> { order('announcements.created_at DESC') }
end
