class Admin::AccountsController < ApplicationController
  before_filter :store_location, only: [:index]
  before_filter :require_admin

  def index
    @accounts = User.all.order("created_at DESC")
  end

  def new
  end

  def create
  end

  def edit
    @account = User.find(params[:id])
    if @account
      render
    else
      redirect_to admin_accounts_path, notice: "User account not found."
    end
  end

  def update
    @account = User.find(params[:id])
    # Rails.logger.debug "===> (1)"
    if @account.update(account_params)
      redirect_to admin_accounts_path, notice: "#{@account.profile.nama_penuh} account has been updated."
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def account_params
    params.require(:account).permit(:login, :email, profile_attributes: [:id, :user_id, :nama_penuh, :tel_num, :facebook_id, :nama_waris, :hub_waris, :tel_num_waris, :nama_bank, :nama_akaun, :no_akaun])
  end
end