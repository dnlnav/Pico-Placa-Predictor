# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

s1 = Schedule.create!(start: '7:00', end: '9:30')
s2 = Schedule.create!(start: '16:00', end: '19:30')

(1..10).each do |n|
    Restriction.create!(plate_number: n%10, day_of_week: (n.to_f/2).round, morning_schedule_id: s1.id, afternoon_schedule_id: s2.id)
end

