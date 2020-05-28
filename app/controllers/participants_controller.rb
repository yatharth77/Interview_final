class ParticipantsController < ApplicationController
	before_action :set_interview
	before_action :authenticate_user!

	def create
		@participant = @interview.participants.build(participant_params.merge(interviewer_id: current_user.id))

		if @participant.save

		  @start_time = @participant.interview.schedule_at
		  @end_time = @participant.interview.end_time
		  @emails.Array
		  @emails.push @participant.user.email

		  duration = (@star_time - Time.now)
		  duration = (duration.to_i - 19800)/60 - 30
		  if duration>0
		  	SendNotification.perform_at(duration.from_now, @interview.schedule_at, @interview.end_time, @emails)
		  end
		  InterviewMailer.interview_confirmation(@participant).deliver
	      flash[:success] = "Your participant has been added!"
	      redirect_to interviews_path
	    else
	      flash[:alert] = "Your new participant couldn't be added!  Please check user id"
	      redirect_to root_path
	    end
	end

	def destroy
	  @participant = @interview.participants.find(params[:id])

	  @participant.destroy
	  InterviewMailer.remove_update(@participant).deliver

	  flash[:success] = "Comment deleted :("
	  redirect_to root_path
	end

	private

	def participant_params
		params.require(:participant).permit(:user_id)
	end
	
	def set_interview
	  	@interview = Interview.find(params[:interview_id])
	end
end
