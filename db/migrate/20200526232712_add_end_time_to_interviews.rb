class AddEndTimeToInterviews < ActiveRecord::Migration[6.0]
  def change
    add_column :interviews, :end_time, :datetime
    # remove_index :interviews, [:meet_link]
  	add_index :interviews, [:meet_link], unique: true
  end
end
