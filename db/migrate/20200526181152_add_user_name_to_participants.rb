class AddUserNameToParticipants < ActiveRecord::Migration[6.0]
  def change
    add_column :participants, :user_name, :string
  end
end
