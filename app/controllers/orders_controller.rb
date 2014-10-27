class OrdersController < ApplicationController
	before_filter :set_user, only: [:index, :new, :create, :show, :destroy]
  before_filter :set_order, only: [:show, :destroy]
	before_filter :require_user

  def index
  	@orders = Order.where(user_id: @user)
    respond_to do |format|
      format.html { @orders }
      format.json { render json: @orders.to_json(include: [:status, :package, :discount]) }
    end
  end

  def new
    @order ||= Order.new
    render
  end

  def create
    @order = @user.orders.new(order_params)
    if @order.save
      redirect_to orders_path, notice: "New order has been created."

      # total price
      @total_price = @order.price.to_i * @order.gram_quantity.to_i
      @order.update_attributes(:total_price => @total_price)

      # reference number
      # random = [('A'..'Z'), ('1'..'9')].map { |i| i.to_a }.flatten
      random = ['1'..'9'].map { |i| i.to_a }.flatten
      ref_number = (0...7).map { random[rand(random.length)] }.join
      @order.update_attributes(:ref_number => "#" + ref_number)

      #ordered date
      @ordered_date = Time.zone.now
      @order.update_attributes(:ordered_date => @ordered_date)
    else
      render 'new'
    end
  end

  def show
    if @order
      respond_to do |format|
        format.html { @order }
        format.json { render json: @order.to_json(include: [:status, :package, :discount]) }
        format.pdf do
          pdf = InvoicePdf.new(@order, view_context)
          send_data pdf.render, filename:
          "order_#{@order.created_at.strftime("%d/%m/%Y")}.pdf",
          type: "application/pdf",
          disposition: "inline"
        end
      end
    else
      redirect_to orders_path, notice: "Order ID not found for that client."
    end
  end

  def destroy
  	@order.destroy
    redirect_to orders_path, notice: "Order has been deleted."
  end

  private

  def set_user
    @user = current_user
  end

  def set_order
    @order = Order.where(slug: params[:id], user: @user).take
  end
end
