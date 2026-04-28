class CreateJoinTblForStudentAndCourses < ActiveRecord::Migration[8.1]
  def change
    create_join_table :students, :courses do |t|

    t.timestamps
    end
  end
end
