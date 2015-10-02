class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :measurement_type
      t.string :name
      t.string :address
      t.string :pincode
      t.string :mobile
      t.references :user
      t.references :category
      t.references :order_item
      t.datetime :avalibility
      t.timestamps null: false
    end
  end
end
