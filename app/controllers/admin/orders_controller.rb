class Admin::OrdersController < ApplicationController
	before_filter :store_location, only: [:index]
  before_filter :require_admin
  
  def index
    @orders = Order.all.order("created_at DESC")
  end

  def show
    @order = Order.find(params[:id])
  end

  private
end
