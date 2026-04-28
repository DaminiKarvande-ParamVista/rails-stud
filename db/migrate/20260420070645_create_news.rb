class CreateNews < ActiveRecord::Migration[8.1]
  def change
    create_table :news do |t|
      t.string :title
      t.boolean :is_alive

      t.timestamps
    end
  end
end
