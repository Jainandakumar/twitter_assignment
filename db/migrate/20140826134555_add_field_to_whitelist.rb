class AddFieldToWhitelist < ActiveRecord::Migration
  def change
    add_column :whitelists, :whitelist_user_id, :string
  end
end
