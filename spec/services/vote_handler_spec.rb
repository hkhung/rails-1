require 'rails_helper'

describe VoteHandler do
	describe '#next_joke' do
		let!(:user)					{ create(:user) }
		let!(:articles)			{ create_list(:article, 2) }
		let!(:vote)					{ create(:vote, user_id: user.id, article_id: articles.last.id) }

		let!(:votehandler)	{ VoteHandler.new({ user_id: user.id }) }

		it 'returns first next joke' do
			vote
			expect(votehandler.next_joke.id).to eq articles.first.id
		end
	end

	describe '#delete' do
		let!(:user)					{ create(:user) }
		let!(:article)			{ create(:article) }
		let!(:vote)					{ create(:vote, article_id: article.id, user_id: user.id)}
		let!(:votehandler)	{ VoteHandler.new({ user_id: user.id, article_id: article.id }) }

		it 'deletes a vote of user' do
			vote
			expect{ votehandler.delete }.to change{ Vote.count }.from(1).to(0) 
		end
	end

	describe '#user' do
		let!(:user)					{ create(:user) } 
		let!(:votehandler)	{ VoteHandler.new({ user_id: user.id}) }

		it 'returns a user' do 
			expect(votehandler.user.id).to eq user.id
		end
	end

	describe '#article' do
		let!(:article)					{ create(:article) } 
		let!(:votehandler)			{ VoteHandler.new({ article_id: article.id}) }

		it 'returns a user' do 
			expect(votehandler.article.id).to eq article.id
		end
	end

	describe '#vote' do
		let!(:article)					{ create(:article) } 
		let!(:user)							{ create(:user) } 
		let!(:votehandler)			{ VoteHandler.new({ article_id: article.id, user_id: user}) }

		it 'returns a user' do 
			expect{ votehandler.vote }.to change{ Vote.count }.from(0).to(1)
		end
	end
end