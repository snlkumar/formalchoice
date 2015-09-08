class PocketsController < ApplicationController
	def index
		@pockets = Pocket.all
	end

	def new
		@pocket = Pocket.new
	end

	def create
		@pocket = Pocket.new pocket_params
		@pocket.save
		render "show"
	end

	def show
	end

	def edit
		@pocket = Pocket.find params[:id]
	end

	def update
		@pocket = Pocket.find params[:id]
		if @pocket.update_attributes pocket_params
			redirect_to pockets_path
		else
			render "edit"
		end
	end

	def destroy
		@pocket = Pocket.find params[:id]
		@pocket.destroy
		redirect_to pockets_path
	end

	private
	def pocket_params
		params[:pocket].permit!
	end
end
