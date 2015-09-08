class PleatsController < ApplicationController
	def index
		@pleats = Pleat.all
	end

	def new
		@pleat = Pleat.new
	end

	def create
		@pleat = Pleat.new pleat_params
		if @pleat.save
			redirect_to pleats_path
		else
			render "new"
		end
	end

	def show
	end

	def edit
		@pleat = Pleat.find params[:id]
	end

	def update
		@pleat = Pleat.find params[:id]
		if @pleat.update_attributes pleat_params
			redirect_to pleats_path
		else
			render "edit"
		end
	end

	def destroy
		@pleat = Pleat.find params[:id]
		@pleat.destroy
		redirect_to pleats_path
	end

	private
	def pleat_params
		params[:pleat].permit!
	end
end
