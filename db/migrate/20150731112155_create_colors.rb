class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
    	t.string :name
    	t.string :code
    	t.boolean :isactive, default: true
      t.timestamps null: false
    end
  end
end
