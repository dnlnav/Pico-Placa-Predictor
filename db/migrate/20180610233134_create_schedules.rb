class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.time :start
      t.time :end

      t.timestamps
    end
  end
end
