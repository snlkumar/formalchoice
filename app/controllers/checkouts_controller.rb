class CheckoutsController < ApplicationController
	layout 'checkout'
	def index
		@order =Order.find session[:order]
		@order.build_shipping_address
	end
end
