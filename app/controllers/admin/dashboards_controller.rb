class Admin::DashboardsController < ApplicationController
  before_filter :store_location, only: [:index]
  before_filter :require_admin

  def index
    @users = User.all.order("created_at DESC")
    @pending = Order.all.where(:status_id =>  3)
    @active = Order.all.where(:status_id =>  1)

    respond_to do |format|
    	format.html
    	format.csv { send_data @active.to_csv }
    	format.xls
    end
  end
  
end