class Article < ActiveRecord::Base
	belongs_to :author, class_name: User
	has_many :voted, class_name: ArticleUser

	validates :title, presence: true
	validates :content, presence: true, length: { minimum: 10}

	has_attached_file :image, styles: { thumb: "100x100#", medium: "300x300>" }
  validates_attachment :image, presence: true,
	  content_type: { content_type: /\Aimage\/.*\Z/ },
	  size: { in: 0..10.megabytes }

	scope :canRead, -> (user_id = nil){ where.not( id: ArticleUser.select(:article_id).where(user_id: user_id) )}
	
end
