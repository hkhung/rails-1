class AddUserVoteArticles < ActiveRecord::Migration
  def change
  	create_table :users_articles do |f|
  		f.belongs_to :user, index: true
  		f.belongs_to :article, index: true 
  		f.boolean :vote, default: true
  	end
  end
end
