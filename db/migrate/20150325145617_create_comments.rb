class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.string :delete_flg
      t.integer :article_id
      t.integer :user_id
      t.datetime :created_at
      t.datetime :update_at
      t.integer :version
      t.timestamps null: false
    end
  end
end
