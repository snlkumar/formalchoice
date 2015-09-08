class PantFasteningsController < ApplicationController
	def index
		@pant_fastenings = PantFastening.all
	end

	def new
		@pant_fastening = PantFastening.new
	end

	def create
		@pant_fastening = PantFastening.new pant_fastening_params
		if @pant_fastening.save
			redirect_to pant_fastenings_path
		else
			render "new"
		end
	end

	def show
	end

	def edit
		@pant_fastening = PantFastening.find params[:id]
	end

	def update
		@pant_fastening = PantFastening.find params[:id]
		if @pant_fastening.update_attributes pant_fastening_params
			redirect_to pant_fastenings_path
		else
			render "edit"
		end
	end

	def destroy
		@pant_fastening = PantFastening.find params[:id]
		@pant_fastening.destroy
		redirect_to pant_fastenings_path
	end

	private
	def pant_fastening_params
		params[:pant_fastening].permit!
	end
end
