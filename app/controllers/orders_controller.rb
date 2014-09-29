class OrdersController < ApplicationController
	before_filter :set_user, only: [:index, :show, :destroy]
	before_filter :require_user

  def index
  	@orders = Order.where(user_id: @user)
    respond_to do |format|
      format.html { @orders }
      format.json { render json: @orders.to_json(include: [:status, :package, :discount]) }
    end
  end

  def show
  	@order = Order.where(slug: params[:id], user: @user).take
    if @order
      respond_to do |format|
        format.html { @order }
        format.json { render json: @order.to_json(include: [:status, :package, :discount]) }
      end
    else
      redirect_to orders_path, notice: "Order ID not found for that client."
    end
  end

  def destroy
  	@order = Order.where(slug: params[:id], user: @user).take
  	@order.destroy
    redirect_to orders_path, notice: "Order has been deleted."
  end

  private

  def set_user
    @user = current_user
  end
end
