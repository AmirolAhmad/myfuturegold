class PagesController < ApplicationController
  before_filter :store_location
  before_filter :disable_header, only: [:index]
  
  def index
    @user = current_user
    @announcement = Announcement.first
    @order = Order.where(user_id: @user).to_a

    @disable_header = true
  end

  def about
  end
end
