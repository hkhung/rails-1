class ChangeArticleUserToVote < ActiveRecord::Migration
  def change
  	rename_table :article_users, :votes
  end
end
