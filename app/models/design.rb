class Design < ActiveRecord::Base
	belongs_to :order_item
	has_one :back_pocket
	has_one :bottom
	has_one :back_pocket
	has_one :collar
	has_one :fit
	has_one :pant_cuff
	has_one :pant_fastening
	has_one :placket
	has_one :plate
	has_one :pleat
	has_one :pocket
	has_one :side_pocket
	has_one :sleeve
end
