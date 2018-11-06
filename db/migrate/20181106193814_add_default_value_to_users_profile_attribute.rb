class AddDefaultValueToUsersProfileAttribute < ActiveRecord::Migration[5.1]
  def change
      change_column :users, :profile, :boolean, default: false
  end
end
