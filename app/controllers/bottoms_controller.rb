class BottomsController < ApplicationController
	def index
		@bottoms = Bottom.all
	end

	def new
		@bottom = Bottom.new
	end

	def create
		@bottom = Bottom.new bottom_params
		if @bottom.save
			redirect_to bottoms_path
		else
			render "new"
		end
	end

	def show
	end

	def edit
		@bottom = Bottom.find params[:id]
	end

	def update
		@bottom = Bottom.find params[:id]
		if @bottom.update_attributes bottom_params
			redirect_to bottoms_path
		else
			render "edit"
		end
	end

	def destroy
		@bottom = Bottom.find params[:id]
		@bottom.destroy
		redirect_to bottoms_path
	end

	private
	def bottom_params
		params[:bottom].permit!
	end
end
