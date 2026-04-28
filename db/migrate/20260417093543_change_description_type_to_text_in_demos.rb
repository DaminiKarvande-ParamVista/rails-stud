class ChangeDescriptionTypeToTextInDemos < ActiveRecord::Migration[8.1]
  # Way 1: Using reversible block
  # def change
  #   reversible do |dir|
  #     dir.up do
  #       change_column :demos, :description, :text
  #     end

  #     dir.down do
  #       change_column :demos, :description, :string
  #     end
  #   end
  # end

  # Way 2: Using up and down methods
  def up 
    change_column :demos, :description, :text
   end
   def down
     change_column :demos, :description, :string
   end
end
