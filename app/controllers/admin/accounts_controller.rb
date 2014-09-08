class Admin::AccountsController < ApplicationController
  before_filter :store_location, only: [:index]

  def new
  	
  end

  def create
  	
  end

  def index
  end

  def edit
  	
  end

  def update
  	
  end

  def destroy
  	
  end

  private

  def profile_params
    params.require(:profile).permit(:id, :nama_penuh, :tel_num, :facebook_id, :nama_waris, :hub_waris, :tel_num_waris, :nama_bank, :nama_akaun, :no_akaun, :user_id)
  end
end
