class OrderItemsController < ApplicationController
	include OrderItemsHelper
	# before_filter :login_required
	def new
		# session[:order] = nil
		# debugger
		if session[:order].nil?
			# order = Order.last
			order = Order.create(user_id: 1, order_status: "initiate")
			@order_item = OrderItem.new(order_id: order.id, product_id: params[:id], quantity: 1, price: price)
			session[:order] = order.id
		else
			@order_item = OrderItem.new(order_id: session[:order], product_id: params[:id], quantity: 1, price: price)
		end
	end

	def edit
		@order_item = OrderItem.find params[:id]
	end

  	def create
	    @order_item = OrderItem.new order_item_params
	    if @order_item.save
	    	session[:order_item] = @order_item.id
	   		redirect_to order_steps_path
	   	else
	   		render :new
	   	end
 	end

 	def update
	    @order_item = OrderItem.find(params[:id]) 
	    if @order_item.update_attributes(order_item_params)
	    	# session[:order_item] = @order_item.id
	   		redirect_to order_steps_path
	   	else
	   		render :edit
	   	end
 	end
	private
	def order_item_params
		params.require(:order_item).permit(OrderItem.attribute_names.collect { |att| att.to_sym })
	end
end
