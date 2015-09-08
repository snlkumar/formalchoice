class SidePocketsController < ApplicationController
	def index
		@side_pockets = SidePocket.all
	end

	def new
		@side_pocket = SidePocket.new
	end

	def create
		@side_pocket = SidePocket.new side_pocket_params
		if @side_pocket.save
			redirect_to side_pockets_path
		else
			render "new"
		end
	end

	def show
	end

	def edit
		@side_pocket = SidePocket.find params[:id]
	end

	def update
		@side_pocket = SidePocket.find params[:id]
		if @side_pocket.update_attributes side_pocket_params
			redirect_to side_pockets_path
		else
			render "edit"
		end
	end

	def destroy
		@side_pocket = SidePocket.find params[:id]
		@side_pocket.destroy
		redirect_to side_pockets_path
	end

	private
	def side_pocket_params
		params[:side_pocket].permit!
	end
end
