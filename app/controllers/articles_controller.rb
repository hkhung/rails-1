class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :set_article]
  before_action :set_article, only: [:show, :edit, :update, :destroy]	
  before_action :set_vote, only: [:index, :show]  
  def index
    @articles = Article.all
    @articles = Article.canRead(current_user.id) if current_user
    @articles = @articles.limit(1)
    @vote     = ArticleUser.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_article)
    
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @article.update(params_article)
      redirect_to @article
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @article.destroy
    redirect_to articles_path
  end
  
  private

  def set_article 
    @article = Article.find(params[:id])
  end

  def set_vote
    @vote     = ArticleUser.new
  end

  def params_article
    params.require(:article).permit(
                                    :title,
                                    :excerpt,
                                    :content,
                                    :image )
  end 
end
