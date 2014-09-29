class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Authenticable

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:login, :email, :password, :password_confirmation, :current_password) }
  end

  def user_params
    params.require(:user).permit(:id, :login, :email,
      profile_attributes: [
        :id, :user_id, :nama_penuh, :ic_number, :tel_num, :facebook_id, :nama_waris, :hub_waris, :tel_num_waris, :nama_bank, :nama_akaun, :no_akaun
      ])
  end

  def order_params
    params.require(:order).permit(:id, :user_id, :package_id, :discount_id, :status_id, :status_name, :gram_quantity, :price, :total_price, :ref_number,
      status_attributes: [
        :id, :status_name
      ],
      discount_attributes: [
        :id, :discount_date, :discount_price
      ],
      package_attributes: [
        :id, :package_name, :selling_price, :buying_price, :price, :term_contract
      ],
      user_attributes: [
        :id, :login, :email
      ])
  end

  def payment_params
    params.require(:payment).permit(:id, :user_id, :order_id, :payment_date, :method, :status, :total_payment, :receipt_number)
  end
end
