class BackPocketsController < ApplicationController
	def index
		@pockets = BackPocket.all
	end

	def new
		@pocket = BackPocket.new
	end

	def create
		@pocket = BackPocket.new pocket_params
		if @pocket.save
			redirect_to back_pockets_path
		else
			render "new"
		end
	end

	def show
	end

	def edit
		@pocket = BackPocket.find params[:id]
	end

	def update
		@pocket = BackPocket.find params[:id]
		if @pocket.update_attributes pocket_params
			redirect_to back_pockets_path
		else
			render "edit"
		end
	end

	def destroy
		@pocket = BackPocket.find params[:id]
		@pocket.destroy
		redirect_to back_pockets_path
	end

	private
	def pocket_params
		params[:back_pocket].permit!
	end
end
