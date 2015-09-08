class PlatesController < ApplicationController
	def index
		@plates = Plate.all
	end

	def new
		@plate = Plate.new
	end

	def create
		@plate = Plate.new plate_params
		if @plate.save
			redirect_to plates_path
		else
			render "new"
		end
	end

	def show
	end

	def edit
		@plate = Plate.find params[:id]
	end

	def update
		@plate = Plate.find params[:id]
		if @plate.update_attributes plate_params
			redirect_to plates_path
		else
			render "edit"
		end
	end

	def destroy
		@plate = Plate.find params[:id]
		@plate.destroy
		redirect_to plates_path
	end

	private
	def plate_params
		params[:plate].permit!
	end
end
