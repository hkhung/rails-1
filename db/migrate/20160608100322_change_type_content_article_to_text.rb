class ChangeTypeContentArticleToText < ActiveRecord::Migration
  def change
  	change_column :articles, :content, :text
  	change_column :articles, :excerpt, :text
  end
end
