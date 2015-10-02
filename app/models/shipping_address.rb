class ShippingAddress < ActiveRecord::Base
	validates :first_name, presence: true
	belongs_to :order
	belongs_to :user
end
