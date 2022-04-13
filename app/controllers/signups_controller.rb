class SignupsController < ApplicationController

    def create 
        signup = Signup.create!(create_params)
        render json: signup, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity

    end

    private

    def create_params
        params.permit(:camper_id, :activity_id, :time)
    end

end
