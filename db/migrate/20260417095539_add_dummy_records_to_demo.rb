class AddDummyRecordsToDemo < ActiveRecord::Migration[8.1]
  def change
    # This migration is intended to add dummy records to the demos table for testing purposes.
    # This is reversible but will create 10 more records instead of deleting them when rolled back.
    # 10.times do |i|
    #   p "Creating demo record #{i+1}"
    #   Demo.create(name: "Demo name #{i+1}", description: "This is demo record number #{i+1}")
    # end

    # To make it truly reversible, we can use the reversible method to define both the up and down actions.
    reversible do |dir|
        dir.up do 
          10.times do |i|
            p "Creating demo record #{i+1}"
            Demo.create(name: "Demo name #{i+1}", description: "This is demo record number #{i+1}")
          end
        end

        dir.down do
          10.times do |i|
            p "Deleting demo record #{i+1}"
            Demo.find_by(name: "Demo name #{i+1}").destroy
          end
        end
      end
  end
end