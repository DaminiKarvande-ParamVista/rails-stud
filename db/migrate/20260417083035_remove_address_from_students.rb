class RemoveAddressFromStudents < ActiveRecord::Migration[8.1]
  def change
    remove_column :students, :address, :string
  end
end
