class OrdersController < ApplicationController
	layout 'checkout'
	def invoice
		
	end

	def update
		@order = Order.find params[:id]
		if @order.update_attributes params[:order].permit!
			session[:order] = nil
			redirect_to invoice_orders_path(@order)
		else

			p "the errors is #{@order.errors.full_messages}"
			render '/checkouts/index' 
		end
	end
end
