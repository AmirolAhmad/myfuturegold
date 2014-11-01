class PagesController < ApplicationController
  before_filter :store_location
  
  def index
    @user = current_user
    @announcement = Announcement.first
    @order = Order.where(user_id: @user).to_a
  end

  def about
  end
end
