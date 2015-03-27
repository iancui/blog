class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.string :delete_flg
      t.integer :user_id
      t.datetime :created_at
      t.datetime :update_at
      t.integer :version
      t.timestamps null: false
    end
  end
end
