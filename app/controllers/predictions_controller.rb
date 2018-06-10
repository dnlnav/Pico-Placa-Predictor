class PredictionsController < ApplicationController
    def new
        @result_message = Restriction.predict(prediction_params)
    end

    private
        def prediction_params
            params.require(:prediction).permit(:license_plate, :date, :time)
        end
end
