class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :product
      t.references :pocket
      t.references :back_pocket
      t.string :avatar
      t.timestamps null: false
    end
  end
end
