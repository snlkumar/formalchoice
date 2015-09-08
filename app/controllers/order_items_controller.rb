class OrderItemsController < ApplicationController

	def index
	end

	def new
		# @order = Order.create(user_id: 1, order_status: "initiate")
		@order = Order.last
		session[:order_item_params] ||= {product_id: params[:id], order_id: @order.id}
	  	# @order = Order.new(session[:order_params])
	  	# product_id: params[:id], order_id: @order.id
		
		@order_item = OrderItem.new session[:order_item_params]

		@order_item.current_step = session[:order_step]
	end

	def create
		# params.require(:order_item).permit(:name, measurements_attributes: Measurement.attribute_names.collect { |att| att.to_sym })
		session[:order_item_params].deep_merge!(params.require(:order_item).permit(:name, measurement_attributes: [:name])) if params[:order_item]
		@order_item = OrderItem.new(session[:order_item_params])
		debugger
		@order_item.build_measurement if @order_item.current_step == "designing"
		@order_item.current_step = session[:order_step]
		puts "i am in params with #{@order_item.current_step} and #{session[:order_item_params]} and #{@order_item.attributes}"
		# if @order_item.current_step == "designing"
		# 	session[:design] = session[:order_item_params]
		# 	# debugger
			# unless params[:back_button]
		# end
		if @order_item.valid?
			if params[:back_button]
				 @order_item.previous_step
			elsif @order_item.last_step?
				@order_item.save if @order_item.all_valid?
			else
				@order_item.next_step
			end
			session[:order_step] = @order_item.current_step
		end
		if @order_item.new_record?
	    	render "new"
	  	else
		    session[:order_step] = session[:order_item_params] = nil
		    flash[:notice] = "Order saved!"
		    redirect_to @order_item
	  	end
	end

	def show
	end

	def edit
		@order_item = OrderItem.last
		session[:order_item_params] ||= {product_id: params[:id], order_id: @order.id}
	  	# @order = Order.new(session[:order_params])
	  	# product_id: params[:id], order_id: @order.id
		
		@order_item = OrderItem.new session[:order_item_params]
		@order_item.current_step = session[:order_step]

	end

	def update
	end

	def destroy
	end
end
