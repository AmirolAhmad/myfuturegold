class Admin::UsersController < ApplicationController
  before_filter :set_user, only: [:edit]
  before_filter :store_location, only: [:index]
  before_filter :require_admin

  def index
  	@users = User.all.order("created_at DESC")
  end

  def edit
    if @user
      render
    else
      redirect_to admin_users_path, notice: "User profile not found."
    end
  end

  def update
    # Rails.logger.debug "===> (1)"
    @user = User.find(params[:id])
    # @user = User.find_or_create_by(id: current_user.id)
    
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "#{@user.profile.nama_penuh} account has been updated."
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :login, :email, profile_attributes: [:id, :user_id, :nama_penuh, :tel_num, :facebook_id, :nama_waris, :hub_waris, :tel_num_waris, :nama_bank, :nama_akaun, :no_akaun])
  end
end
