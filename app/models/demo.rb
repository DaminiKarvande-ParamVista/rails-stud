class Demo < ApplicationRecord
    include Validatable
    has_one :sub_demo
    before_create :greeting_message

    def greeting_message
        puts "Hello, this is a greeting message before creating a Demo record!"
    end

    # Use this only when you have single line code to execute before creating a record, otherwise use the method approach as shown above.   
    # before_create do 
    #     puts "Hello, this is a greeting message before creating a Demo record! 2"
    # end
end
