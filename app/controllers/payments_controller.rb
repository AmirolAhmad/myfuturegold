class PaymentsController < ApplicationController
  before_filter :set_user, only: [:index, :new, :create, :show]
  before_filter :require_user

  def index
    @payments = Payment.where(user_id: @user)
    respond_to do |format|
      format.html { @payments }
      format.json { render json: @payments.to_json(include: [:user, :order]) }
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

      PaymentMailer.payment_email(@payment).deliver
      PaymentMailer.notify_admin(@payment).deliver

      redirect_to payment_path(@payment), notice: "Thank you for submitting a payment. An admin will respond to you shortly."

      #send sms with twillio
      client = Twilio::REST::Client.new(Settings.twilio.sid, Settings.twilio.token)

      # Create and send an SMS message
      client.account.sms.messages.create(
        from: Settings.twilio.from,
        to: "+6#{@user.profile.tel_num}",
        body: "Hi #{@user.login}, thank you for submitting a payment RM #{@payment.total_payment} with receipt number #{@payment.receipt_number} . An admin will respond to you shortly. Thank you!"
      )

      # Create and send an SMS message to admin
      client.account.sms.messages.create(
        from: Settings.twilio.from,
        to: "+60122873632",
        body: "NOTIFICATION: A user #{@user.login} has make a payment with receipt number #{@payment.receipt_number} - RM #{@payment.total_payment} just now. Please respond to his/her payment. Thank you!"
      )

    else
      render 'new'
    end
  end

  def show
    @payment = Payment.where(id: params[:id], user: @user).take
    if @payment
      respond_to do |format|
        format.html { @payment }
        format.json { render json: @payment.to_json(include: [:user, :order]) }
        format.pdf do
          pdf = PaymentPdf.new(@payment, view_context)
          send_data pdf.render, filename:
          "payment_#{@payment.created_at.strftime("%d/%m/%Y")}.pdf",
          type: "application/pdf",
          disposition: "inline"
        end
      end
    else
      redirect_to payments_path, notice: "Payment ID not found for that client."
    end
  end

  private

  def set_user
    @user = current_user
  end
end
