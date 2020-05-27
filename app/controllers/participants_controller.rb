class ParticipantsController < ApplicationController
	before_action :set_interview
	before_action :authenticate_user!

	def create
		@participant = @interview.participants.build(participant_params.merge(interviewer_id: current_user.id))

		if @participant.save
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
