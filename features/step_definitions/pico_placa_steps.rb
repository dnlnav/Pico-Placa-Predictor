Given("I'm in the page") do
    visit root_path
end

When("I enter {string}, {string} and {string}") do |license_plate, date, time|
    fill_in "license_plate", with: license_plate
    fill_in "date",	with: date
    fill_in "time",	with: time
    click_button
end

Then("I should see {string}") do |result_message|
    expect(page).to have_css('#result', text: result_message)
end