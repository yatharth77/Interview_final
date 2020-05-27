class ChangeIntervieweeIdToBeIntegerInParticipants < ActiveRecord::Migration[6.0]
  def change
  	def up
	    change_column :participants, :interviewee_id, :integer
	  end

	  def down
	    change_column :participants, :interviewee_id, :string
  end
  end
end
