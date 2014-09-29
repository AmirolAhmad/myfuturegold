class PaymentsController < ApplicationController
  before_filter :set_user, only: [:index, :show, :destroy]
  before_filter :require_user

  def index
    @payments = Payment.where(user_id: @user)
  end

  def show
    @payment = Payment.where(id: params[:id], user: @user).take
    if @payment
      render
    else
      redirect_to orders_path, notice: "Payment ID not found for that client."
    end
  end

  def destroy
    @payment = Payment.where(id: params[:id], user: @user).take
    @payment.destroy
    redirect_to payments_path, notice: "Payment has been deleted."
  end

  private

  def set_user
    @user = current_user
  end
end
