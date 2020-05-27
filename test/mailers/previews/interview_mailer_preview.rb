# Preview all emails at http://localhost:3000/rails/mailers/interview_mailer
class InterviewMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/interview_mailer/interview_confirmation
  def interview_confirmation
    InterviewMailer.interview_confirmation
  end

end
