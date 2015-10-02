class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
       	t.references  :order
    	t.references  :product
    	t.references :pleat
    	t.references :pocket
    	t.references :bottom
    	t.references :placket
    	t.references :collar
    	t.references :sleeve
    	t.references :pant_fastening
    	t.references :plate
    	t.references :pant_cuff
    	t.references :back_pocket
    	t.references :side_pocket
    	t.references :fit
        t.float :price
    	t.integer  :quantity
      	t.timestamps null: false
    end
  end
end
