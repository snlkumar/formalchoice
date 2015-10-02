class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
    	t.references :order
    	t.references :user
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.string :state
    	t.string :city
    	t.string :pincode

      t.timestamps null: false
    end
  end
end
