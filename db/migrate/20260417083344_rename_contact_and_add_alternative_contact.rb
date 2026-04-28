class RenameContactAndAddAlternativeContact < ActiveRecord::Migration[8.1]
  def change
    rename_column :students, :phone_number, :permanent_contact
    add_column :students, :alternative_contact, :string
  end
end
