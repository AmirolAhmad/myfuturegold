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
end