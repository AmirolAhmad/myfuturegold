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
        :id, :user_id, :nama_penuh, :ic_number, :tel_num, :facebook_id, :nama_waris, :hub_waris, :tel_num_waris, :nama_bank, :nama_akaun, :no_akaun, :address1, :address2, :city, :state, :postcode, :country, :ic_num_heir1, :heir1_address1, :heir1_address2, :heir1_city, :heir1_state, :heir1_postcode, :heir1_country, :heir1_email, :heir1_fb_id, :heir2_name, :heir2_rel, :heir2_phone_num, :ic_num_heir2, :heir2_address1, :heir2_address2, :heir2_city, :heir2_state, :heir2_state, :heir2_postcode, :heir2_country, :heir2_email, :heir2_fb_id
      ])
  end

  def order_params
    params.require(:order).permit(:id, :user_id, :package_id, :discount_id, :status_id, :status_name, :gram_quantity, :price, :total_price, :restock, :discount_per_gram, :total_discount, :ref_number,
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

  def voucher_params
    params.require(:voucher).permit(:id, :user_id, :order_id, :voucher_date, :method, :status, :total_payment, :receipt_number)
  end

  def inbox_params
    params.require(:inbox).permit(:id, :user_id, :ticket_id, :subject, :description, :status, :category)
  end

  def announcement_params
    params.require(:announcement).permit(:id, :user_id, :subject, :description)
  end
end
