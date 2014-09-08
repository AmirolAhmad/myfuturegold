module Authenticable
  extend ActiveSupport::Concern
  included do
    helper_method :require_admin, :store_location
  end

  private
  def require_admin
    unless current_user.try(:admin?)
     flash.notice = “Permissions required to access this page.”
     redirect_to root_path
    end
  end

  def store_location
    session[:return_to] = request.original_url rescue nil
  end

  def require_user
    unless current_user
      store_location
      flash[:alert] = "You must be logged in to view this page."
      redirect_to login_url
      return false
    end
  end
end