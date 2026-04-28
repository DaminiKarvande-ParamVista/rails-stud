class RemoveDobFromStudents < ActiveRecord::Migration[8.1]
  def change
    remove_column :students, :dob, :date
  end
end
