class CreateStudents < ActiveRecord::Migration[8.1]
  def change
    create_table :students do |t|
      t.timestamps
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
    end
  end
end
