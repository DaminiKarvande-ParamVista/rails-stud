namespace :example_task do
    desc 'Greeting Messages'

    task greet_the_user: :environment do
        puts 'hello user'
    end

    task say_by_to_the_user: :environment do
        puts 'Bye user'
    end
end

# how to run 

# rails example_task:greet_the_user

# rails example_task:say_by_to_the_user
# rails rake_file_name:Task_name