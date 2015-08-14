class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
    	t.string :name, null: false
    	t.string :discount_type, null: false
    	t.integer :value, null: false    	
    	t.datetime :valid_from
    	t.datetime :valid_upto
      t.boolean :is_active, default: false
      t.timestamps null: false
    end
  end
end
