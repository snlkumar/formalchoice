class FitsController < ApplicationController
	def index
		@fits = Fit.all
	end

	def new
		@fit = Fit.new
	end

	def create
		@fit = Fit.new fit_params
		if @fit.save
			redirect_to fits_path
		else
			render "new"
		end
	end

	def show
	end

	def edit
		@fit = Fit.find params[:id]
	end

	def update
		@fit = Fit.find params[:id]
		if @fit.update_attributes fit_params
			redirect_to fits_path
		else
			render "edit"
		end
	end

	def destroy
		@fit = Fit.find params[:id]
		@fit.destroy
		redirect_to fits_path
	end

	private
	def fit_params
		params[:fit].permit!
	end
end
