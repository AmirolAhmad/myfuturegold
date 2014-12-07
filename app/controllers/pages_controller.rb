class PagesController < ApplicationController
  before_filter :store_location, only: [:index]
  before_filter :disable_header, only: [:index]
  
  def index
    @user = current_user
    @announcement = Announcement.first
    @order = Order.where(user_id: @user).to_a

    # orders = Order.all
    @tw = grand_total_weight
    @td = grand_total_discount

    @disable_header = true
  end

  def about
  end

  private  

  def grand_total_weight
    Order.where('package_id' => 6, 'status_id' => 1, user_id: current_user).sum(:gram_quantity).to_i
  end

  def grand_total_discount
    Order.where('package_id' => 6, 'status_id' => 1, user_id: @user).sum(:total_discount).to_i
  end
end
