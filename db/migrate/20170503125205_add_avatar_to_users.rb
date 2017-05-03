class AddAvatarToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar, :string, null: false, default: "/images/avatar.jpg"
  end
end
