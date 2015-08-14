class Admin < ActiveRecord::Base
	has_one :user, dependent: :destroy
	accepts_nested_attributes_for :user
end
