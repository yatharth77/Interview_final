class AddUserNameToInterview < ActiveRecord::Migration[6.0]
  def change
    add_column :interviews, :user_name, :string
  end
end
