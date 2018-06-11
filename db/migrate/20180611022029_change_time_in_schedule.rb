class ChangeTimeInSchedule < ActiveRecord::Migration[5.1]
  def change
    change_column :schedules, :start, :string
    change_column :schedules, :end, :string
  end
end
