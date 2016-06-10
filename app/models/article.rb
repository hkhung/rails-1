class Article < ActiveRecord::Base
	belongs_to :author, class_name: 'User'
	has_many :votes

	validates :title, presence: true
	validates :content, presence: true, length: { minimum: 10}

	has_attached_file :image, styles: { thumb: "100x100#"}
  validates_attachment :image, presence: true,
	  content_type: { content_type: /\Aimage\/.*\Z/ },
	  size: { in: 0..10.megabytes }
	  
end
