module ApplicationHelper
	include Paperclip::Glue
	def own_article(article_id)
		if !current_user
			return false
		end
		
		own = Article.where({ author_id: current_user.id, id: article_id})
		return true if own.any?
		return false
	end
end
