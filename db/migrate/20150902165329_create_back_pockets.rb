class CreateBackPockets < ActiveRecord::Migration
  def change
    create_table :back_pockets do |t|
      t.string :name
      t.float :price
      t.string :category
       t.string :avatar
      t.timestamps null: false
    end
  end
end
