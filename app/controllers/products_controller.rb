class ProductsController < ApplicationController
	# layout 'application'
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

	def details
		@product = Product.find params[:id]
	end

	def design
		# puts "i am in with the params#{params}"
		# @order = Order.new
		@order = Order.create(user_id: 1, order_status: "initiate")
		@order_item = OrderItem.new(product_id: params[:id], order_id: @order.id)
	end
	
	private
	def product_params
		params[:product].permit!
	end


end
