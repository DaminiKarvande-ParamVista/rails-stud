class AddAttrsToStudent < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :dob, :date
    add_column :students, :age, :integer
  end
end
