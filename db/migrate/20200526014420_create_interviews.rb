class CreateInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews do |t|
      t.string :topic
      t.string :role
      t.integer :user_id
      t.datetime :schedule_at
      t.string :meet_link

      t.timestamps
    end
  end
end
