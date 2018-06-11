class Schedule < ApplicationRecord
    has_many :morning_restrictions, class_name: "Restriction", foreign_key: "morning_schedule_id"
    has_many :afternoon_restrictions, class_name: "Restriction", foreign_key: "afternoon_schedule_id"
end
