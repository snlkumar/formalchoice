class Brand < ActiveRecord::Base
	validates :name, :code, uniqueness: true, presence: true
	validates :contact, :dealin, :founder,  presence: true
end
