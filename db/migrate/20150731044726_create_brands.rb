class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :code
      t.string :founder
      t.string :address
      t.string :contact
      t.references :category
      t.string :description
      t.boolean :isactive, default: true
      t.timestamps null: false
    end
  end
end
