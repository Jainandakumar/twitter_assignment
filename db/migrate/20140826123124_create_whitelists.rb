class CreateWhitelists < ActiveRecord::Migration
  def change
    create_table :whitelists do |t|
      t.string :user_id

      t.timestamps
    end
  end
end
