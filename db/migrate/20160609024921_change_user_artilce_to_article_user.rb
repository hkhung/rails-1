class ChangeUserArtilceToArticleUser < ActiveRecord::Migration
  def change
  	rename_table :users_articles, :articles_users
  end
end
