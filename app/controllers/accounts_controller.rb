class AccountsController < ApplicationController
	before_filter :set_user, only: [:edit, :update, :destroy]
	before_filter :require_user

	def show
		@users = current_user # grab user details from current User DB Table
		@user = @users.profile # grab user profile from Profile DB Table
	end

	def edit
		if @user
      render
    else
      redirect_to account_path, notice: "Your profile not found."
    end
	end

	def update
		if @user.update(user_params)
      redirect_to account_path, notice: "#{@user.profile.nama_penuh} account has been updated."
    else
      render 'edit'
    end
	end

	private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:id, :login, :email, profile_attributes: [:id, :user_id, :nama_penuh, :tel_num, :facebook_id, :nama_waris, :hub_waris, :tel_num_waris, :nama_bank, :nama_akaun, :no_akaun])
  end
end
