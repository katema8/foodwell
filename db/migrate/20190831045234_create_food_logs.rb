class CreateFoodLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :food_logs do |t|
      t.integer :food_item_id
      t.date :date
      t.integer :wellness_log_id
      t.integer :user_id

      t.timestamps
    end
  end
end
