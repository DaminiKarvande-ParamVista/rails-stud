class RenameEmailToEmailAddress < ActiveRecord::Migration[8.1]
  def change
    rename_column :students, :email, :email_address
  end
end
