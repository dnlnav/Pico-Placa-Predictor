require 'rails_helper'

RSpec.describe PredictionsController, type: :controller do
    describe "POST show" do
        let(:params) do
            {
                license_plate: 'PSA-0123',
                date: '2018-06-18',
                time: '23:00'
            }
        end
        let(:restriction) { class_double("Restriction").as_stubbed_const }

        before do
            allow(restriction).to receive(:predict).and_return('Go Ahead!')
        end

        it "creates a new prediction" do
            expect(restriction).to receive(:predict).with(params.with_indifferent_access)
            post :create, params: params, format: 'json'
        end
        it "gets the result" do
            post :create, params: params, format: 'json'
            expect(assigns[:result_message]).to eq('Go Ahead!')
        end
        it "sends json message" do
            expected = {:message  => 'Go Ahead!'}.to_json
            post :create, params: params, format: 'json'
            expect(response.body).to eq(expected)
        end
    end
end
