class AddAvatarToPockets < ActiveRecord::Migration
  def change
    add_column :pockets, :avatar, :string
  end
end
