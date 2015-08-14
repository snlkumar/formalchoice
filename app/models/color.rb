class Color < ActiveRecord::Base
	validates :name, :code, uniqueness: true, presence: true
end
