require 'rails_helper'

RSpec.describe "predictions/new.html.erb", type: :view do
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
      expect(rendered).to have_selector("input[type='text'][name='license_plate']")
    end
  it "should render a date field" do
      expect(rendered).to have_selector("input[type='date'][name='date']")
    end
  it "should render a time field" do
      expect(rendered).to have_selector("input[type='time'][name='time']")
    end
end
