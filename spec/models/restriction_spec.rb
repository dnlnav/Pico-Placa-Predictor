require 'rails_helper'

RSpec.describe Restriction, type: :model do
	describe "#predict" do
		let(:params) { {license_plate: 'PSA-0121', date: '2018-06-12', time: '7:00'} }
		context "user doesn't have pico y placa" do
			it "should return 'Go Ahead!'" do
				expect(Restriction.predict(params)).to eq('Go Ahead!')
			end
		end
		context "user has pico y placa" do
			it "should return 'Stay Home!'" do
				params[:date] = '2018-06-11'
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
				expect(@restriction.send(:is_restriction_time?, time)).to eq(true)
			end
		end
		context "is not" do
			it "returns false" do
				time = '12:00'.to_time
				expect(@restriction.send(:is_restriction_time?, time)).to eq(false)
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
				expect(@restriction.send(:is_restriction_day?, date)).to eq(true)
			end
		end
		context "is not" do
			it "returns false" do
				date = '2018-06-07'
				expect(@restriction.send(:is_restriction_day?, date)).to eq(false)
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
	describe "#valid_data?" do

		let(:license_plate) { 'PSA-0121' }
		let(:date) { '2018-06-13' }
		let(:time) { '09:00' }

		context "when license_plate is wrong" do
			it "returns false" do
				license_plate = 'PSA-0121a'

				expect(Restriction.send(:valid_data?, license_plate, date, time)).to eq(false)
			end
		end
		context "when license_plate is blank" do
			it "returns false" do
				license_plate = ''
				expect(Restriction.send(:valid_data?, license_plate, date, time)).to eq(false)
			end
		end
		context "when license_plate is correct" do
			it "returns true" do
				license_plate = 'PSA-0121'
				expect(Restriction.send(:valid_data?, license_plate, date, time)).to eq(true)
			end
		end
		context "when date is blank" do
			it "returns false" do
				date = ''
				expect(Restriction.send(:valid_data?, license_plate, date, time)).to eq(false)
			end
		end
		context "when date is wrong" do
			it "returns false" do
				date = '2018-13-41'
				expect(Restriction.send(:valid_data?, license_plate, date, time)).to eq(false)
			end
		end
		context "when time is blank" do
			it "returns false" do
				time = ''
				expect(Restriction.send(:valid_data?, license_plate, date, time)).to eq(false)
			end
		end
		context "when time is wrong" do
			it "returns false" do
				time = '25:00'
				expect(Restriction.send(:valid_data?, license_plate, date, time)).to eq(false)
			end
		end

	end
	describe "#is_numeric?" do
		context "when is number" do
			it "returns true" do
				number = 1
				expect(Restriction.send(:is_numeric?, number)).to eq(true)
			end
		end
		context "when is numberic" do
			it "returns true" do
				number = '1'
				expect(Restriction.send(:is_numeric?, number)).to eq(true)
			end
		end
		context "when is not number" do
			it "returns false" do
				number = 'a'
				expect(Restriction.send(:is_numeric?, number)).to eq(false)
			end
		end
	end
end
