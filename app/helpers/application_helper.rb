module ApplicationHelper
	def brands
		Brand.where(isactive: true)
	end

	def colors
		Color.where(isactive: true)
	end

	def discounts
		Discount.all
	end
end
