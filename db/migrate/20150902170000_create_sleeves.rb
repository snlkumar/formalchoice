class CreateSleeves < ActiveRecord::Migration
  def change
    create_table :sleeves do |t|
      t.string :name
      t.float :price
      t.string :category
       t.string :avatar
      t.timestamps null: false
    end
  end
end
