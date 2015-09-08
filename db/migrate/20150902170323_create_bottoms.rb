class CreateBottoms < ActiveRecord::Migration
  def change
    create_table :bottoms do |t|
      t.string :name
      t.float :price
      t.string :category
       t.string :avatar
      t.timestamps null: false
    end
  end
end
