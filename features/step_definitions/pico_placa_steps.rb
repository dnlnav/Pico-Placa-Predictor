Given("I'm in the page") do
    visit root_path
end

When("I enter {string}, {string} and {string}") do |license_plate, date, time|
    fill_in "License Plate", with: license_plate
    fill_in "Date",	with: date
    fill_in "Time",	with: time
    click_button
end

Then("I should see {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end