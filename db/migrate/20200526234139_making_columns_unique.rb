class MakingColumnsUnique < ActiveRecord::Migration[6.0]
  def change
  	add_index :users, [:user_name], unique: true
  	add_index :users, [:Phone], unique: true
  end
end
