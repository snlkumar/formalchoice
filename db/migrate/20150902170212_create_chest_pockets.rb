class CreateChestPockets < ActiveRecord::Migration
  def change
    create_table :chest_pockets do |t|
      t.string :name
      t.float :price
      t.string :category

      t.timestamps null: false
    end
  end
end
