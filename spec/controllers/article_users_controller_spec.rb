require 'rails_helper'

describe ArticleUsersController, type: :controller do

  describe '#create' do
    def do_request
      post :create , article_user: params_vote
    end

    let!(:user)               {  create(:user) }
    let!(:article)            {  create(:article) }
    let!(:params_vote)        {  attributes_for(:article_user, user_id: user.id, article_id: article.id) } 

    before { sign_in user }

    it 'creates new a vote' do
      expect{ do_request }.to change{ ArticleUser.count }.from(0).to(1)
      expect(response).to redirect_to articles_path
    end
  end

  describe '#destroy' do
    def do_request
      delete :destroy, params
    end

    let!(:user)         { create(:user) }
    let!(:article)      { create(:article) }
    let!(:article_user) { create(:article_user, user_id: user.id, article_id: article.id) }
    let!(:params)       { { id: article_user.id}}

    before { sign_in user }

    it 'deletes the vote' do
      expect{ do_request }.to change{ ArticleUser.count }.from(1).to(0)
      expect(response).to redirect_to articles_path
    end
  end
end
