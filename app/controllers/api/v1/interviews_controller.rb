module Api
	module V1
		class InterviewsController < ApplicationController
			skip_before_action :verify_authenticity_token
			def index
				interviews = Interview.all
				render json: {status: 'SUCCESS', message: 'Loaded Interview', data: interviews}, status: :ok
			end

			def show
				interview = Interview.find(params[:id])
				render json: {status: 'SUCCESS', message: 'Loaded Interview', data: interview}, status: :ok
			end

			def create
				interview = Interview.new(interview_params)
				if interview.save
					render json: {status: 'SUCCESS', message: 'Interview Saved', data: interview}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Interview Not Saved ', data: interview.errors}, status: :unprocessable_entity
				end
			end

			def destroy
				interview = Interview.find(params[:id])
				interview.destroy	
				render json: {status: 'SUCCESS', message: 'Interview Deleted', data: interview}, status: :ok

			end

			private

			def interview_params
				params.require(:interview).permit(:user_name, :user_id, :topic, :role, :schedule_at, :end_time, :meet_link)
			end
		end
	end
end