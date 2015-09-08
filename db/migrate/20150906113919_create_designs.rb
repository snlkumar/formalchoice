class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
    	t.references :order_item, null: false    	
      	t.timestamps null: false
    end
  end
end
