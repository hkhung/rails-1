class ArticleVote
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :user_id, :article_id

  def initialize(attributes)
    return if attributes.nil? 
  end

  def user
    User.find(user_id)
  end  

  def article
    Article.find(article_id)
  end

  def vote
    article.users << user
  end

  def persisted?
    false
  end
end