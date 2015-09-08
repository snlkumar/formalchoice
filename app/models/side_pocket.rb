class SidePocket < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader	
	belongs_to :design
	has_many :order_items
end
