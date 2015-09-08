class Image < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	belongs_to :product	
	belongs_to :back_pocket
	belongs_to :pocket
end
