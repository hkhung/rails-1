class ChangeTableNameArticleUsers < ActiveRecord::Migration
	def change
		rename_table :articles_users, :article_users
	end
end
