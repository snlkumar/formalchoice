class FiltersController < ApplicationController
	def index
		@products = Product.by_brand(params[:brand_ids])		
	end
end
