class ChangeTypeOfDescriptionInDemos < ActiveRecord::Migration[8.1]
  def change
    change_column :demos, :desction, :text
  end
end
