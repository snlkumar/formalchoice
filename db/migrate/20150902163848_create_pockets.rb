class CreatePockets < ActiveRecord::Migration
  def change
    create_table :pockets do |t|
      t.string :name
      t.float :price
      
      t.timestamps null: false
    end
  end
end
