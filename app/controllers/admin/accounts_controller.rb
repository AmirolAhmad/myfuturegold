class Admin::AccountsController < ApplicationController
  before_filter :store_location, only: [:index]
  before_filter :require_admin

  def index
    @users = User.all.order("created_at DESC")
  end

  def new
  end

  def create
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
