class VoteHandler 
	attr_accessor :user_id, :article_id

	def initialize(attributes = nil)
		return if attributes.nil? 
		attributes.each { |name, value| send("#{name}=", value.kind_of?(Array) ? value.reject(&:empty?).collect(&:to_i) : value) }
	end

	def next_joke
		@articles   = Article.all
		@articles   = @articles.where.not( id: Vote.select(:article_id).where(user_id: user_id) )
		@articles.first 
	end

	def delete
		return if user.nil?  
		user.votes.where(article_id: article_id ).destroy_all

	end

	def user
		User.find(user_id) if user_id.present?
	end  

	def article
		Article.find(article_id) if article_id.present? 
	end

	def vote(vote = 'like')
		return if user.nil? 
		v = user.votes.where(article: article).first_or_initialize(article: article)
		v.vote = vote
		v.save
	end
end