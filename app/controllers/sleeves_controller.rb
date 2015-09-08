class SleevesController < ApplicationController
	def index
		@sleeves = Sleeve.all
	end

	def new
		@sleeve = Sleeve.new
	end

	def create
		@sleeve = Sleeve.new sleeve_params
		if @sleeve.save
			redirect_to sleeves_path
		else
			render "new"
		end
	end

	def show
	end

	def edit
		@sleeve = Sleeve.find params[:id]
	end

	def update
		@sleeve = Sleeve.find params[:id]
		if @sleeve.update_attributes sleeve_params
			redirect_to sleeves_path
		else
			render "edit"
		end
	end

	def destroy
		@sleeve = Sleeve.find params[:id]
		@sleeve.destroy
		redirect_to sleeves_path
	end

	private
	def sleeve_params
		params[:sleeve].permit!
	end
end
