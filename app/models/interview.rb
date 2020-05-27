class Interview < ApplicationRecord
	belongs_to :user
	has_many :participants, dependent: :destroy

	validate :link_must_contain_com, :time_must_not_clash

	private

	def link_must_contain_com
		if !meet_link.include?"com"
			errors.add(:meet_link, "Meeting Link is invalid")
		end
	end

	def time_must_not_clash
		ints = Interview.all
		if schedule_at >= end_time
			errors.add(:schedule_at, "Start time cannot be greater than End time")
			return
		end
		ints.each do |p|
			if p.id == self.id
				next
			end
			if ((p.schedule_at..p.end_time).cover?schedule_at) || ((p.schedule_at..p.end_time).cover?end_time)  || ((schedule_at..end_time).cover?p.schedule_at)
				errors.add(:schedule_at, "Metting Timings clash with other interviews")
			end
		end
	end
end
