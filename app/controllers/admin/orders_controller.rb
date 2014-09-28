class Admin::OrdersController < ApplicationController
  before_filter :set_user, only: [:index, :create, :show, :edit, :update, :destroy, :new]
  before_filter :set_order, only: [:show, :edit, :update, :destroy]
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

  def new
    @order ||= Order.new
    render
  end

  def create
    @order = @user.orders.new(order_params)
    if @order.save
      redirect_to admin_user_orders_path, notice: "New order has been created."

      # total price
      @total_price = @order.price.to_i * @order.gram_quantity.to_i
      @order.update_attributes(:total_price => @total_price)

      # reference number
      random = [('A'..'Z'), ('1'..'9')].map { |i| i.to_a }.flatten
      ref_number = (0...10).map { random[rand(random.length)] }.join
      @order.update_attributes(:ref_number => ref_number)

      #ordered date
      @ordered_date = Time.now
      @order.update_attributes(:ordered_date => @ordered_date)
    else
      render 'new'
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

  def destroy
    @order.destroy
    redirect_to admin_user_orders_path, notice: "Order has been deleted."
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_order
    @order = Order.where(slug: params[:id], user: @user).take
  end
end
