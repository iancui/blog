class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :delete_flg
      t.datetime :created_at
      t.datetime :update_at
      t.integer :version
      t.timestamps null: false
    end
  end
end
