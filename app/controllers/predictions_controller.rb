class PredictionsController < ApplicationController
    def create
        @result_message = Restriction.predict(prediction_params)
        
    end

    private
        def prediction_params
            params.permit(:license_plate, :date, :time)
        end
end
