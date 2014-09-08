class AccountsController < ApplicationController
	before_filter :require_user

	def show
		@user = current_user.profile # grab user profile from Profile DB Table
		@users = current_user # grab user details from current User DB Table
	end
end
