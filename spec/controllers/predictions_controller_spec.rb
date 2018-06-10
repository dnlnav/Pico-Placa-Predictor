require 'rails_helper'

RSpec.describe PredictionsController, type: :controller do
    describe "POST show" do
        let(:params) do
            {
                license_plate: 'PSA-0123',
                date: '18/06/2018',
                time: '23:00'
            }
        end
        let(:restriction) { class_double("Restriction").as_stubbed_const }

        before do
            allow(restriction).to receive(:predict).and_return('Go Ahead!')
        end

        it "creates a new prediction" do
            expect(restriction).to receive(:predict).with(params.with_indifferent_access)
            post :new, params: { prediction: params }
        end
        it "returns the result" do
            post :new, params: { prediction: params }
            expect(assigns[:result_message]).to eq('Go Ahead!')
        end
    end
end
