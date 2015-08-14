class Seller < ActiveRecord::Base
	has_one :user, dependent: :destroy
	has_many :products
	accepts_nested_attributes_for :user	
end
