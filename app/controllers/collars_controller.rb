class CollarsController < ApplicationController
	def index
		@collars = Collar.all
	end

	def new
		@collar = Collar.new
	end

	def create
		@collar = Collar.new collar_params
		if @collar.save
			redirect_to collars_path
		else
			render "new"
		end
	end

	def show
	end

	def edit
		@collar = Collar.find params[:id]
	end

	def update
		@collar = Collar.find params[:id]
		if @collar.update_attributes collar_params
			redirect_to collars_path
		else
			render "edit"
		end
	end

	def destroy
		@collar = Collar.find params[:id]
		@collar.destroy
		redirect_to collars_path
	end

	private
	def collar_params
		params[:collar].permit!
	end
end
