class Brand < ActiveRecord::Base
	validates :name, uniqueness: true, presence: true
	# validates :contact, :dealin, :founder,  presence: true
end
