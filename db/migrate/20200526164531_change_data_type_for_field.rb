class ChangeDataTypeForField < ActiveRecord::Migration[6.0]
  def change
  	change_column :participants, :interviewee_id, :integer
  end
end
