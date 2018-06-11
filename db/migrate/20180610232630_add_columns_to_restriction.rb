class AddColumnsToRestriction < ActiveRecord::Migration[5.1]
  def change
    add_column :restrictions, :plate_number, :integer
    add_reference :restrictions, :morning_schedule, foreign_key: true
    add_reference :restrictions, :afternoon_schedule, foreign_key: true
    add_column :restrictions, :day_of_week, :integer
  end
end
