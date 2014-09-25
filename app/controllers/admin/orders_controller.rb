class Admin::OrdersController < ApplicationController
  before_filter :set_user, only: [:index, :show, :edit, :update]
  before_filter :set_order, only: [:show, :edit, :update]
	before_filter :store_location, only: [:index]
  before_filter :require_admin
  
  def index
    @orders = Order.where(user_id: @user).to_a
    respond_to do |format|
      format.html { @orders }
      format.json { render json: @orders.to_json(include: [:status, :package, :discount]) }
    end
  end

  def show
    if @order
      render
    else
      redirect_to admin_user_orders_path, notice: "Order ID not found for that client."
    end
    respond_to do |format|
      format.html { @order }
      format.json { render json: @order.to_json(include: [:status, :package, :discount]) }
    end
  end

  def edit
    if @order
      render
    else
      redirect_to admin_user_orders_path, notice: "Order ID not found."
    end
  end

  def update
    if @order.update(order_params)
      redirect_to admin_user_orders_path, notice: "Ref Number #{@order.ref_number} has been updated."

      @total_price = @order.price.to_i * @order.gram_quantity.to_i
      @order.update_attributes(:total_price => @total_price)
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_order
    @order = Order.where(id: params[:id], user: @user).take
  end
end
