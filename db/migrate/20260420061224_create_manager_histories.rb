class CreateManagerHistories < ActiveRecord::Migration[8.1]
  def change
    create_table :manager_histories do |t|
      t.date :joinig_date
      t.string :total_experience
      t.references :manager, null: false, foreign_key: true

      t.timestamps
    end
  end
end
