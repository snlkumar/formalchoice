class Product < ActiveRecord::Base
	belongs_to :color
	belongs_to :brand
	belongs_to :seller
	belongs_to :discount
	has_many :images
	accepts_nested_attributes_for :images
end