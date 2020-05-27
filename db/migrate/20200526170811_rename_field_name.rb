class RenameFieldName < ActiveRecord::Migration[6.0]
  def change
  	rename_column :participants, :interviewee_id, :user_id
  end
end
