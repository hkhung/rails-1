class ArticleUsersController < ApplicationController  
	
	def index; end

	def show; end

	def create
		vote = ArticleUser.where(params_vote)
		if vote.count < 1
			vote = ArticleUser.new(params_vote)
			vote.vote = params[:article_user][:vote]
			vote.save
		end  

    redirect_to articles_path
	end

	def destroy
		@vote = ArticleUser.find(params[:id]) 
		@vote.destroy

    redirect_to articles_path
	end

	private
	def params_vote
    params.require(:article_user).permit(
                                    :article_id,
                                    :user_id)
  end 
end