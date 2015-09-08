class OrdersController < ApplicationController

	def create
		
		@order = Order.new

		@order.current_step = session[:order_step]
		puts "i am in params with #{@order.current_step}"
		if params[:back_button]
			 @order.previous_step
		else
			@order.next_step
		end
		session[:order_step] = @order.current_step
		render "products/design"
	end
end
