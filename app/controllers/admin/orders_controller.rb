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
      respond_to do |format|
        format.html { @order }
        format.json { render json: @order.to_json(include: [:status, :package, :discount]) }
      end
    else
      redirect_to admin_user_orders_path, notice: "Order ID not found for that client."
    end
  end

  def new
    @order ||= Order.new
    render
  end

  def create
    @order = @user.orders.new(order_params)
    if @order.save

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

      OrderMailer.order_email(@order).deliver

      if @order.package_id == 4
        @total_discount = 54 * @order.gram_quantity.to_i
        @order.update_attributes(:total_discount => @total_discount)
      end

      if @order.package_id == 6
        #discount_per_gram
        @discount_per_gram = @order.package.buying_price - @order.package.selling_price
        @order.update_attributes(:discount_per_gram => @discount_per_gram)

        #total_discount
        @total_discount = @order.discount_per_gram * @order.gram_quantity.to_i
        @order.update_attributes(:total_discount => @total_discount)
      end

      if @order.package_id == 7
        @total_discount = 30 * @order.gram_quantity.to_i
        @order.update_attributes(:total_discount => @total_discount)
      end

      redirect_to admin_user_order_path(id:@order), notice: "New order has been created."

      #send sms with twillio
      client = Twilio::REST::Client.new(Settings.twilio.sid, Settings.twilio.token)

      # Create and send an SMS message
      client.account.sms.messages.create(
        from: Settings.twilio.from,
        to: "+6#{@user.profile.tel_num}",
        body: "Hi #{@user.login}, new order no #{@order.ref_number} with programme #{@order.package.package_name} has been added into your account. Please login to view the order. Thank you!"
      )
      
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
      redirect_to admin_user_order_path(id:@order), notice: "Ref Number #{@order.ref_number} has been updated."

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
