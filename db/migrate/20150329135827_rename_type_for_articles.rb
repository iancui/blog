class RenameTypeForArticles < ActiveRecord::Migration
  def change
    rename_column :articles ,:type,:article_type
  end
end
