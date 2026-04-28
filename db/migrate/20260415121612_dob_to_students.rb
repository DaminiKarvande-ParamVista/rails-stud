class DobToStudents < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :dob, :date
  end
end
