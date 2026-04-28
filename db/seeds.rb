# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#create single student record
# student = Student.create(first_name: "John", last_name: "Doe", email_address: "john.doe@example.com", phone_number: "123-456-7890", address: "123 Main St", wa_contat: "+1234567890")
# #create multiple student records
# students = Student.create([
#   { first_name: "Jane", last_name: "Smith", email_address: "jane@example.com", phone_number: "987-654-3210", address: "456 Elm St", wa_contat: "+0987654321" },
#   { first_name: "Alice", last_name: "Johnson", email_address: "alice@example.com", phone_number: "555-555-5555", address: "789 Oak St", wa_contat: "+1122334455" }])

# iterate 
# 20.times do |i|
#     p "ceating student #{i}"
#     Student.create(
#         first_name: "FirstName#{i}",
#         last_name: "LastName#{i}",
#         email_address: "email#{i}@",
#         permanent_contact: "123-456-789#{i}",
#         wa_contat: "+123456789#{i}",
#         local_address: "#{i} Local St",
#         permanent_address: "#{i} Permanent St"

#     )
# end

# Student.all.each do |student|
#     student.blogs.create(title: "Blog Title for #{student.id}", content: "This is a blog post for #{student.id} #{student.first_name}.")
#     student.blogs.create(title: "Blog Title for #{student.id}", content: "This is a blog post for #{student.id} #{student.first_name}.")
# end

Course.create(name: "Mathematics", description: "This is a course about mathematics.")
Course.create(name: "Science", description: "This is a course about science.")
Course.create(name: "History", description: "This is a course about history.")
Course.create(name: "Literature", description: "This is a course about literature.")
Course.create(name: "Art", description: "This is a course about art.")