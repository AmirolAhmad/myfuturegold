class Admin::OrdersController < ApplicationController
  before_filter :set_user, only: [:show]
	before_filter :store_location, only: [:index]
  before_filter :require_admin
  
  def index
    @orders = Order.all.order("created_at DESC")
    respond_to do |format|
      format.html { @orders }
      format.json { render json: @orders.to_json(include: [:status, :package, :discount]) }
    end
  end

  def show
    respond_to do |format|
      format.html { @order }
      format.json { render json: @order.to_json(include: [:status, :package, :discount]) }
    end
  end

  private

  def set_user
    @order = Order.find(params[:id])
  end
end
