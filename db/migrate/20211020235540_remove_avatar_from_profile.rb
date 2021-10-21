class RemoveAvatarFromProfile < ActiveRecord::Migration[6.1]
  def change
    remove_column :profiles, :avatar, :string
  end
end
