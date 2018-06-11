class Restriction < ApplicationRecord
    belongs_to :morning_schedule, class_name: "Schedule", foreign_key: "morning_schedule_id"
    belongs_to :afternoon_schedule, class_name: "Schedule", foreign_key: "afternoon_schedule_id"

    def self.predict(params)
        last_number, date, time = params[:license_plate][-1], params[:date], params[:time]
        restriction = Restriction.find_by_plate_number(last_number)
        restriction.is_restricted?(date, time) ? 'Stay Home!' : 'Go Ahead!'
    end

    def is_restricted?(date, time)
        is_restriction_time?(time) && is_restriction_date?(date)
    end

    def is_restriction_time?(time)
        time.to_time.between?(morning_schedule.start.to_time, morning_schedule.end.to_time) ||
        time.to_time.between?(afternoon_schedule.start.to_time, afternoon_schedule.end.to_time)
    end

    def is_restriction_date?(date)
        date.to_date.wday == day_of_week
    end

end
