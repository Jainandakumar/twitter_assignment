class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :screen_name
      t.string :user_id

      t.timestamps
    end
  end
end
