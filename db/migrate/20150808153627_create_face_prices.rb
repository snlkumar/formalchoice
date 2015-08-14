class CreateFacePrices < ActiveRecord::Migration
  def change
    create_table :face_prices do |t|
      
      t.timestamps null: false
    end
  end
end
