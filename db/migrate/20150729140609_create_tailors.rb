class CreateTailors < ActiveRecord::Migration
  def change
    create_table :tailors do |t|

      t.timestamps null: false
    end
  end
end
