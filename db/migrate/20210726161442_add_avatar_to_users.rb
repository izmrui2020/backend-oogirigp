class AddAvatarToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avatarSrc, :string
  end
end
