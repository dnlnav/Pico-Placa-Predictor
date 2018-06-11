require 'rails_helper'

RSpec.describe Restriction, type: :model do
	describe "#predict" do
		context "user doesn't have pico y placa" do
			it "should return 'Go Ahead!'" do
				params = {
					license_plate: 'PSA-0121',
					date: '2018-06-12',
					time: '7:00'
				}
				expect(Restriction.predict(params)).to eq('Go Ahead!')
			end
		end
		context "user has pico y placa" do
			it "should return 'Stay Home!'" do
				params = {
					license_plate: 'PSA-0121',
					date: '2018-06-11',
					time: '16:00'
				}
				expect(Restriction.predict(params)).to eq('Stay Home!')
			end
		end
	end

	describe "#is_restriction_time?" do
		before do
			@restriction = Restriction.new(
				morning_schedule: Schedule.new(start: '07:00', end:'9:30'),
				afternoon_schedule: Schedule.new(start: '16:00', end:'19:30')
			)
		end
		context "is restriction time" do
			it "returns true" do
				time = '9:00'
				expect(@restriction.is_restriction_time?(time)).to eq(true)
			end
		end
		context "is not" do
			it "returns false" do
				time = '12:00'.to_time
				expect(@restriction.is_restriction_time?(time)).to eq(false)
			end
		end
	end
	describe "#is_restriction_day?" do
		before do
			@restriction = Restriction.new(
				day_of_week: 5
			)
		end
		context "is restriction day" do
			it "returns true" do
				date = '2018-06-08'
				expect(@restriction.is_restriction_date?(date)).to eq(true)
			end
		end
		context "is not" do
			it "returns false" do
				date = '2018-06-07'
				expect(@restriction.is_restriction_date?(date)).to eq(false)
			end
		end
	end
	describe "#is_restricted?" do
		before do
			@restriction = Restriction.new(
				day_of_week: 5,
				morning_schedule: Schedule.new(start: '07:00', end:'9:30'),
				afternoon_schedule: Schedule.new(start: '16:00', end:'19:30')
			)
		end
		context "user doesn't have pico y placa this this nor day" do
			it "should return false" do
				date = '2018-06-07'
				time = '23:00'
				expect(@restriction.is_restricted?(date, time)).to eq(false)
			end
		end
		context "user has pico y placa at this time but not day" do
			it "should return false" do
				date = '2018-06-07'
				time = '09:00'
				expect(@restriction.is_restricted?(date, time)).to eq(false)
			end
		end
		context "user has pico y placa at this day but not time" do
			it "should return false" do
				date = '2018-06-08'
				time = '23:00'
				expect(@restriction.is_restricted?(date, time)).to eq(false)
			end
		end
		context "when user has pico y placa" do
			it "should return true" do
				date = '2018-06-08'
				time = '09:00'
				expect(@restriction.is_restricted?(date, time)).to eq(true)
			end
		end
	end
end
