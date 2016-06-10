require 'rails_helper'

describe ArticlesController, type: :controller do

  describe "#index" do
    def do_request
      get :index
    end

    it 'renders the :index on view' do
      do_request
      expect(response).to render_template :index
    end
  end

  describe '#new' do 
    def do_request
      get :new
    end

    let!(:user)       {  create(:user) }

    before { sign_in user }

    it 'renders the :new on view' do
      do_request
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    def do_request
      post :create , article: params_article
    end

    let!(:user)               {  create(:user) }
    let!(:params_article)     {  attributes_for(:article, author_id: user.id) } 

    before { sign_in user }

    it 'creates new a article' do
      expect{ do_request }.to change{ Article.count }.from(0).to(1)
      expect(response).to redirect_to assigns(:article)
    end
  end

  describe '#edit' do
    def do_request
      get :edit, params
    end

    let!(:article)    { create(:article)}
    let!(:params)     { { id: article.id}}
    let!(:user)       {  create(:user) }

    before { sign_in user }

    it 'renders the :edit on view' do
      do_request
      expect(response).to render_template :edit
    end
  end  

  describe '#update' do
    def do_request
      patch :update, params
    end

    let!(:new_name)          { 'A joke a day keeps the doctor away NEW' }
    let!(:article)           { create(:article) } 
    let!(:params)            { { id: article.id, article: update_params } }
    let!(:update_params)     { { title: new_name } }
    let!(:user)              { create(:user) }

    before { sign_in user }

    it 'renders the :edit on view' do
      do_request
      expect(article.reload.title).to eq new_name
      expect(response).to redirect_to assigns(:article)
    end
  end

  describe '#show' do
    def do_request
      delete :show, params
    end

    let!(:article)    { create(:article)}
    let!(:params)     { { id: article.id}}

    it 'renders the :show on view' do
      do_request
      expect(assigns(:article)).to eq article
      expect(response).to render_template :show
    end 
  end

  describe '#destroy' do
    def do_request
      delete :destroy, params
    end

    let!(:article)    { create(:article)}
    let!(:params)     { { id: article.id}}
    let!(:user)       { create(:user) }

    before { sign_in user }

    it 'deletes the article' do
      expect{ do_request }.to change{ Article.count }.from(1).to(0)
      expect(response).to redirect_to articles_path
    end
  end
end
