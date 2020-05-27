class InterviewsController < ApplicationController
	before_action :set_interview, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	
	def index
		# SendNotification.perform_async("date1","date2")
		@interviews = Interview.where(user_id: current_user.id)
	end

	def new
		@interview = current_user.interviews.build
	end

	def create
		@interview = current_user.interviews.build(interview_params)
		@interview.user_name = current_user.user_name
		if @interview.save
	      flash[:success] = "Your interview has been created!"
	      redirect_to interviews_path
	    else
	      flash[:alert] = "Your new interview couldn't be created!  Please check the form."
	      render :new
	    end
	end

	def edit
		@interview = Interview.find(params[:id])
	end

	def update
		if @interview.update(interview_params)
		  members = Participant.where(interview_id: @interview.id)
		  @emails = Array.new

		  members.each do |memeber|
		     @emails.push memeber.user.email
		  end

		  duration = (@interview.end_time - Time.now)/60 - 30
		  SendNotification.perform_at(duration.minutes.from_now, @interview.schedule_at, @interview.end_time, @emails)
		  InterviewMailer.interview_update(@interview).deliver
	      flash[:success] = "Interview updated."
	      redirect_to interviews_path
	    else
	      flash.now[:alert] = "Update failed.  Please check the form."
	      render :edit
	    end
	end

	def show
		redirect_to interviews_path
	end

	def destroy
		@interview.destroy
		redirect_to root_path
	end

	private

	def interview_params
		params.require(:interview).permit(:topic, :role, :schedule_at, :end_time,:meet_link)
	end
	

	def set_interview
		@interview = Interview.find(params[:id])
	end
end
