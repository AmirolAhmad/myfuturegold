class AccountsController < ApplicationController
	before_filter :require_user

	def show
		# @profile = Profile.first
		@user = current_user.profile
	end
end
