class InterviewMailer < ApplicationMailer
  default from: "InterviewNow@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.interview_mailer.interview_confirmation.subject
  #
  def interview_confirmation(participant)
 	@participant = participant

    mail to: participant.user.email , subject: "Interview Scheduled"
  end

  def interview_update(interview)
 	  @interview = interview
 	  memebers = Participant.where(interview_id: @interview.id)

    memebers.each do |memeber|
      email = memeber.user.email
      mail to: email , subject: "Update in Interview Scheduled"
    end
  end

  def interview_notification(start_time,end_time,emails)
    @start_time = start_time
    @end_time = end_time
    emails.each do |email|
      mail to: email , subject: "Reminder Interview Scheduled"
    end
  end

  def remove_update(participant)
    @participant = participant

    mail to: participant.user.email , subject: "Removed from Interview"
  end
end
