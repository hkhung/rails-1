class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :set_article]
  before_action :set_article, only: [:show, :edit, :update, :destroy]	
  before_action :set_vote, only: [:index, :show] 

  def index
    @article  = @vote_handler.next_joke
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

  def like
    @vote_handler = VoteHandler.new({user_id: current_user.id, article_id: params[:id]})
    @vote_handler.vote('like')
    redirect_to articles_path
  end

  def dislike
    @vote_handler = VoteHandler.new({user_id: current_user.id, article_id: params[:id]})
    @vote_handler.vote('dislike')
    redirect_to articles_path
  end
  
  def unvote
    @vote_handler = VoteHandler.new({user_id: current_user.id, article_id: params[:id]})
    @vote_handler.delete
    redirect_to users_path
  end
  private

  def set_article 
    @article = Article.find(params[:id])
  end

  def set_vote
    if user_signed_in?
      @vote_handler = VoteHandler.new({user_id: current_user.id})
    else
      @vote_handler = VoteHandler.new
    end
  end

  def params_article
    params.require(:article).permit(
                                    :title,
                                    :excerpt,
                                    :content,
                                    :image )
  end 
end
