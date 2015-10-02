class Measurement < ActiveRecord::Base
	belongs_to :order_item
	belongs_to :user
	validates :measurement_type, presence: true
	validates :name, :address, :pincode, :mobile, :avalibility, presence: true, :if => Proc.new { |x| x.measurement_type == 'tailor' }
	# validates :name, presence: true, :if => Proc.new { |x| x.measurement_type == 'tailor' }
end
