class Order < ActiveRecord::Base
	attr_writer :current_step	
	has_many :order_items, dependent: :destroy
	has_one :shipping_address, dependent: :destroy
	accepts_nested_attributes_for :shipping_address

	def total
	  self.order_items.map(&:price).sum
	end
end
