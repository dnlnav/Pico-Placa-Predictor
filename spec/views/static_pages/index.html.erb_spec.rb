require 'rails_helper'

RSpec.describe "static_pages/index.html.erb", type: :view do
  let(:prediction) { mock_model("Prediction").as_new_record.as_null_object }
  before do
    assign(:prediction, prediction)
    render
  end
  it "should render a form to input the prediction params" do
    expect(rendered).to have_selector("form[method='post'][action='#{predictions_path}']")
    expect(rendered).to have_selector("input[type='submit']")
  end
  it "should render a text field for license plate" do
      expect(rendered).to have_selector("input[type='text'][name='prediction[license_plate]']")
    end
  it "should render a date field" do
      expect(rendered).to have_selector("input[type='date'][name='prediction[date]']")
    end
  it "should render a time field" do
      expect(rendered).to have_selector("input[type='time'][name='prediction[time]']")
    end
end
