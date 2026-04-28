class RemoveTypoCol < ActiveRecord::Migration[8.1]
  def change
    remove_column :demos, :desction, :text
  end
end
