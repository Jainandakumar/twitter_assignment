class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :oauth_token, :text
    add_column :users, :oauth_secret, :text
  end
end
