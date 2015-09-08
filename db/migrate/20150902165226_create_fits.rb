class CreateFits < ActiveRecord::Migration
  def change
    create_table :fits do |t|
      t.string :name
      t.float :price
       t.string :avatar
      t.timestamps null: false
    end
  end
end
