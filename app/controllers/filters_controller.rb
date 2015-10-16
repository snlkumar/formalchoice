class FiltersController < ApplicationController
	def index
		return @products = Product.all if params[:brand_ids].blank? && params[:fabric_ids].blank?
		@products = Product.where(brand_id: params[:brand_ids])		
	end
end
