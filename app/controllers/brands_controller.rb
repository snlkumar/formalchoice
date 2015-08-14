class BrandsController < ApplicationController
	before_filter :admin_required
	layout 'admin'
	def index
		@brands = Brand.all
	end

	def new
		@brand = Brand.new
	end

	def edit
		@brand = Brand.find params[:id]
	end

	def create
		@brand = Brand.new brand_params
		if @brand.save
			flash[:notice] ="The record save successfully."
			redirect_to admin_brands_path(current_user.admin)
		else
			render "new"
		end
	end

	def update
		@brand  = Brand.find params[:id] 
		if @brand.update_attributes(brand_params)
			flash[:notice] ="The record updated successfully."
			redirect_to admin_brands_path(current_user.admin)
		else
			redirect_to :back
		end
	end

	private
	def brand_params
		params[:brand].permit!
	end
end
