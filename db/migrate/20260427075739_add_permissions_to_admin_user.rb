class AddPermissionsToAdminUser < ActiveRecord::Migration[8.1]
  def change
    add_column :admin_users, :permissions, :json
  end
end
