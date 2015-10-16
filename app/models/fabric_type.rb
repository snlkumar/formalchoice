class FabricType < ActiveRecord::Base
	validates :name, uniqueness: true, presence: true
	belongs_to :category
	has_many :products	
	# validates :contact, :dealin, :founder,  presence: true
end
