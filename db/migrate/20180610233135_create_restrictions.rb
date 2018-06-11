class CreateRestrictions < ActiveRecord::Migration[5.1]
  def change
    create_table :restrictions do |t|
      t.integer :plate_number
      t.integer :morning_schedule_id
      t.integer :afternoon_schedule_id
      t.integer :day_of_week
      t.timestamps
    end
  end
end
