class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
		t.references :user
		t.string :order_status 
		t.float :amount
		t.float :tax_price   	
      	t.timestamps null: false
    end
  end
end
