class Admin::OrdersController < ApplicationController
	before_filter :store_location, only: [:index]
  before_filter :require_admin
  
  def index
  end
end
