class Admin::VouchersController < ApplicationController
  before_filter :set_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_filter :set_voucher
  before_filter :store_location, only: [:index]
  before_filter :require_admin

  def index
    @vouchers = Voucher.where(user_id: @user).to_a
    respond_to do |format|
      format.html { @vouchers }
      format.json { render json: @vouchers.to_json(include: [:user, :order]) }
    end
  end

  def show
    if @voucher
      respond_to do |format|
        format.html { @voucher }
        format.json { render json: @voucher.to_json(include: [:user, :order]) }
      end
    else
      redirect_to admin_user_vouchers_path, notice: "Voucher History not found for that order."
    end
  end

  def new
    @voucher ||= Voucher.new
    render
  end

  def create
    @voucher = @user.vouchers.new(voucher_params)
    if @voucher.save

      random = ['1'..'9'].map { |i| i.to_a }.flatten
      receipt_number = (0...4).map { random[rand(random.length)] }.join
      @voucher.update_attributes(:receipt_number => "#MGR-V" + receipt_number)

      redirect_to admin_user_voucher_path(id:@voucher), notice: "New voucher has been created."

      #send sms with twillio
      client = Twilio::REST::Client.new(Settings.twilio.sid, Settings.twilio.token)

      # Create and send an SMS message
      client.account.sms.messages.create(
        from: Settings.twilio.from,
        to: "+6#{@user.profile.tel_num}",
        body: "Hi #{@user.login}, a voucher has been credited into your account with receipt no #{@voucher.receipt_number}. Please login into your account to view. Thank you!"
      )

    else
      render 'new'
    end
  end

  def edit
    if @voucher
      render
    else
      redirect_to admin_user_vouchers_path, notice: "Voucher ID not found."
    end
  end

  def update
    if @voucher.update(voucher_params)
      redirect_to admin_user_voucher_path(id:@voucher), notice: "Receipt Number #{@voucher.receipt_number} has been updated."
    else
      render 'edit'
    end
  end

  def destroy
    @voucher.destroy
    redirect_to admin_user_vouchers_path, notice: "voucher history has been deleted."
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_voucher
    @voucher = Voucher.where(id: params[:id], user: @user).take
  end
end
