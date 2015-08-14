class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name, null: false
    	t.string :code, null: false
    	t.float :face_price
    	t.float :back_price, default: 0.0
    	t.integer :quantity, null: false
    	t.references :brand, null: false
    	t.references :color, null: false
    	t.references :seller, null: false
        t.references :discount
    	t.boolean :isactive, default: true
    	t.boolean :is_sale, default: false
    	t.float :sale_price, default: 0.0
    	t.string :description
      t.timestamps null: false
    end
  end
end
