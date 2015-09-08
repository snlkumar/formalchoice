class PantCuffsController < ApplicationController
	def index
		@pant_cuffs = PantCuff.all
	end

	def new
		@pant_cuff = PantCuff.new
	end

	def create
		@pant_cuff = PantCuff.new pant_cuff_params
		if @pant_cuff.save
			redirect_to pant_cuffs_path
		else
			render "new"
		end
	end

	def show
	end

	def edit
		@pant_cuff = PantCuff.find params[:id]
	end

	def update
		@pant_cuff = PantCuff.find params[:id]
		if @pant_cuff.update_attributes pant_cuff_params
			redirect_to pant_cuffs_path
		else
			render "edit"
		end
	end

	def destroy
		@pant_cuff = PantCuff.find params[:id]
		@pant_cuff.destroy
		redirect_to pant_cuffs_path
	end

	private
	def pant_cuff_params
		params[:pant_cuff].permit!
	end
end
