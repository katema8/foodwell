class CreateWellnessLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :wellness_logs do |t|
      t.integer :gut_wellness
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
