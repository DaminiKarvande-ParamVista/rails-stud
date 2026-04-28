namespace :active_record_counter do
  desc "Count students Active Record"
  task students_count: :environment do
    p "students Count #{Student.count}"
  end

  desc "Count course Active Record"
  task courses_count: :environment do
    p "course count = #{Course.count}"
  end

end
