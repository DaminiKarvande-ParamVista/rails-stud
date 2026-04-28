class AddColumnsToStudents < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :address, :string
    add_column :students, :wa_contat, :string
  end
end
