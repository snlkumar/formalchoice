class PlacketsController < ApplicationController
	def index
		@plackets = Placket.all
	end

	def new
		@placket = Placket.new
	end

	def create
		@placket = Placket.new placket_params
		if @placket.save
			redirect_to plackets_path
		else
			render "new"
		end
	end

	def show
	end

	def edit
		@placket = Placket.find params[:id]
	end

	def update
		@placket = Placket.find params[:id]
		if @placket.update_attributes placket_params
			redirect_to plackets_path
		else
			render "edit"
		end
	end

	def destroy
		@placket = Placket.find params[:id]
		@placket.destroy
		redirect_to plackets_path
	end

	private
	def placket_params
		params[:placket].permit!
	end
end
