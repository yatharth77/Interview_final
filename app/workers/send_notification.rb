require 'resolv-replace'
class SendNotification
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform(start_time,end_time,emails)
		puts "I am here bro"
		InterviewMailer.interview_notification(start_time,end_time,emails).deliver
	end
end