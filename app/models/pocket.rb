class Pocket < ActiveRecord::Base
	# has_one :image
	 mount_uploader :avatar, AvatarUploader
	 belongs_to :design
	 has_many :order_items
end
