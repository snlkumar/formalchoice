class Product < ActiveRecord::Base
	belongs_to :color
	belongs_to :brand
	belongs_to :seller
	belongs_to :discount
	belongs_to :category
	has_many :images
	accepts_nested_attributes_for :images

	def self.by_brand(brand)	    
	    where(:brand => brand)
	end
end