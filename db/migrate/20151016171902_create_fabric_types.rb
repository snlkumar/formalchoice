class CreateFabricTypes < ActiveRecord::Migration
  def change
    create_table :fabric_types do |t|
    	t.string :name
    	t.references :category
        # t.string :description
        t.boolean :isactive, default: true
        t.timestamps null: false
    end
  end
end
