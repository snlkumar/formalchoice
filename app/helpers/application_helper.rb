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
	def resource_name
		:user
	end
	def resource

		@resource ||= User.new

	end

	def devise_mapping

		@devise_mapping ||= Devise.mappings[:user]

	end
end
