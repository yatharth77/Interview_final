require 'test_helper'

class InterviewMailerTest < ActionMailer::TestCase
  test "interview_confirmation" do
    mail = InterviewMailer.interview_confirmation
    assert_equal "Interview confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
