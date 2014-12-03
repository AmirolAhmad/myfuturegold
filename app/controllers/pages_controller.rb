class PagesController < ApplicationController
  before_filter :store_location
  before_filter :disable_header, only: [:index]
  
  def index
    @user = current_user
    @announcement = Announcement.first
    @order = Order.where(user_id: @user).to_a

    @tw = @user.orders.where('package_id' => 6).sum(:gram_quantity).to_i
    @td = @user.orders.where('package_id' => 6).sum(:total_discount).to_i

    @disable_header = true
  end

  def about
  end
end
