class ProductsController < ApplicationController
	layout 'admin'
	def new
		@product = current_user.seller.products.new
		@product_images = @product.images.build
	end

	def create
		@product = Product.new product_params
		if @product.save
			params[:product_images]['avatar'].each do |a|
          		@product_attachment = @product.images.create!(:avatar => a)
       		end if params[:product_images]
       		redirect_to seller_product_path(current_user.seller, @product), notice: 'Post was successfully created.'			
		else
			render "new"
		end
	end

	def edit
		@product = Product.find params[:id]
	end

	def show
		@product = Product.find params[:id]
	end

	private
	def product_params
		params[:product].permit!
	end


end
