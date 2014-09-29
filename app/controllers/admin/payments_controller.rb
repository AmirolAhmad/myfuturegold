class Admin::PaymentsController < ApplicationController
  before_filter :set_user, only: [:index]
  before_filter :store_location, only: [:index]
  before_filter :require_admin

  def index
    @payments = Payment.where(user_id: @user).to_a
  end
  
  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
