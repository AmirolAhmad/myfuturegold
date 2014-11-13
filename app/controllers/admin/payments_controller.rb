class Admin::PaymentsController < ApplicationController
  before_filter :set_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_filter :set_payment
  before_filter :store_location, only: [:index]
  before_filter :require_admin

  def index
    @payments = Payment.where(user_id: @user).to_a
    respond_to do |format|
      format.html { @payments }
      format.json { render json: @payments.to_json(include: [:user, :order]) }
    end
  end

  def show
    if @payment
      respond_to do |format|
        format.html { @payment }
        format.json { render json: @payment.to_json(include: [:user, :order]) }
      end
    else
      redirect_to admin_user_payments_path, notice: "Payment History not found for that order."
    end
  end

  def new
    @payment ||= Payment.new
    render
  end

  def create
    @payment = @user.payments.new(payment_params)
    if @payment.save

      random = ['1'..'9'].map { |i| i.to_a }.flatten
      receipt_number = (0...4).map { random[rand(random.length)] }.join
      @payment.update_attributes(:receipt_number => "#MFG-P" + receipt_number)

      redirect_to admin_user_payment_path(id:@payment), notice: "New payment has been created."

      #send sms with twillio
      client = Twilio::REST::Client.new(Settings.twilio.sid, Settings.twilio.token)

      # Create and send an SMS message
      client.account.sms.messages.create(
        from: Settings.twilio.from,
        to: "+6#{@user.profile.tel_num}",
        body: "Hi #{@user.login}, thank you for submitting a payment RM #{@payment.total_payment} with receipt number #{@payment.receipt_number} . An admin will respond to you shortly. Thank you!"
      )
      
    else
      render 'new'
    end
  end

  def edit
    if @payment
      render
    else
      redirect_to admin_user_payments_path, notice: "Payment ID not found."
    end
  end

  def update
    if @payment.update(payment_params)
      redirect_to admin_user_payment_path(id:@payment), notice: "Receipt Number #{@payment.receipt_number} has been updated."
    else
      render 'edit'
    end
  end

  def destroy
    @payment.destroy
    redirect_to admin_user_payments_path, notice: "Payment history has been deleted."
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_payment
    @payment = Payment.where(id: params[:id], user: @user).take
  end
end
