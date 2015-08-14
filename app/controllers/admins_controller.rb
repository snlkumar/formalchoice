class AdminsController < ApplicationController
	layout 'admin'
	def signup
		@admin = Admin.new
		@admin.build_user
	end

	def welcome
	end

	def create
		@admin = Admin.new admin_params
		if @admin.save
			redirect_to welcome_admins_path
		else
			redirect_to :back
		end
	end

	private
	def admin_params
		params[:admin].permit!
	end
end
