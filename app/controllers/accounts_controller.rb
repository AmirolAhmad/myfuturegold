class AccountsController < ApplicationController
	before_filter :require_user

	def show
		@users = current_user # grab user details from current User DB Table
		@user = @users.profile # grab user profile from Profile DB Table
	end
end
