class PredictionsController < ApplicationController
    def create
        @result_message = Restriction.predict(prediction_params)
        puts @result_message
        respond_to do |format|
            format.json {render json: {message: @result_message}} 
        end
    end

    private
        def prediction_params
            params.permit(:license_plate, :date, :time)
        end
end
