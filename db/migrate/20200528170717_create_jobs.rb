class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.integer :interview_id
      t.string :job_id

      t.timestamps
    end
  end
end
