class AddAvatarToFruit < ActiveRecord::Migration[5.2]
  def change
    add_column :fruits, :avatar, :string
  end
end
