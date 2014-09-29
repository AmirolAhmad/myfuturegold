class Admin::PaymentsController < ApplicationController
  before_filter :set_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_filter :set_payment
  before_filter :store_location, only: [:index]
  before_filter :require_admin

  def index
    @payments = Payment.where(user_id: @user).to_a
  end

  def show
    if @payment
      render
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
      redirect_to admin_user_payments_path, notice: "New payment has been created."
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
      redirect_to admin_user_payments_path, notice: "Receipt Number #{@payment.receipt_number} has been updated."
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
