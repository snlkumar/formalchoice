class TailorsController < ApplicationController
	def signup
		@tailor = Tailor.new
		@tailor.build_user
	end

	def welcome
	end

	def create
		@tailor = Tailor.new tailor_params
		if @tailor.save
			flash[:notice] = "You have subscribed successfully.Admin will approve you then you will be able to login into system."
			redirect_to welcome_tailors_path
		else
			redirect_to :back
		end
	end

	private
	def tailor_params
		params[:tailor].permit!
	end
end
