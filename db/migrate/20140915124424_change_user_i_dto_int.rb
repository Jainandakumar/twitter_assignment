class ChangeUserIDtoInt < ActiveRecord::Migration
  def change
  	remove_column :users , :user_id
  	add_column :users , :user_id , :integer
  end
end
