class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.integer :interview_id
      t.integer :interviewer_id
      t.string :interviewee_id

      t.timestamps
    end
    add_index :users, :user_name, unique: true
    add_index :interviews, :schedule_at, unique: true
    add_index :interviews, :meet_link, unique: true

  end
end
