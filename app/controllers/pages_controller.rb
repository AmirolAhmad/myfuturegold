class PagesController < ApplicationController
	before_filter :store_location
	
  def index
  	@user = current_user
  end
end
