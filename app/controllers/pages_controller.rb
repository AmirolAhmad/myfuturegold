class PagesController < ApplicationController
  before_filter :store_location, only: [:index]
  before_filter :disable_header, only: [:index]
  
  def index
    @user = current_user
    @announcement = Announcement.first
    @order = Order.where(user_id: @user).to_a

    # orders = Order.all
    @tw = Order.where('package_id' => 6, user_id: @user).sum(:gram_quantity).to_i
    @td = Order.where('package_id' => 6, user_id: @user).sum(:total_discount).to_i

    @disable_header = true
  end

  def about
  end
end
