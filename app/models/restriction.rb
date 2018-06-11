class Restriction < ApplicationRecord
    belongs_to :morning_schedule, class_name: "Schedule", foreign_key: "morning_schedule_id"
    belongs_to :afternoon_schedule, class_name: "Schedule", foreign_key: "afternoon_schedule_id"

    def self.predict(params)
        license_plate, date, time = params[:license_plate], params[:date], params[:time]
        if Restriction.valid_data?(license_plate, date, time)
            restriction = Restriction.find_by_plate_number(license_plate[-1])
            restriction.is_restricted?(date, time) ? 'Stay Home!' : 'Go Ahead!'
        else
            'Error'
        end
    end

    def is_restricted?(date, time)
        is_restriction_time?(time) && is_restriction_day?(date)
    end

    private

        def self.valid_data?(license_plate, date, time)
            begin
                !(!Restriction.is_numeric?(license_plate[-1]) || date.to_date.nil? || time.to_time.nil?)
            rescue
                false
            end
        end

        def is_restriction_time?(time)
            time.to_time.between?(morning_schedule.start.to_time, morning_schedule.end.to_time) ||
            time.to_time.between?(afternoon_schedule.start.to_time, afternoon_schedule.end.to_time)
        end

        def is_restriction_day?(date)
            date.to_date.wday == day_of_week
        end

        def self.is_numeric?(number)
            Float(number) != nil rescue false
        end
end
