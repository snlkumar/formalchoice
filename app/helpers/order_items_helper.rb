module OrderItemsHelper
	def price
		Product.find(params[:id]).back_price
	end
end
