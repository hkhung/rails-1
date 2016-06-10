class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles, :inverse_of => :author
  has_many :voted, class_name: ArticleUser
  
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_attached_file :image, styles: { thumb: "60x60#"}
  validates_attachment :image, presence: true,
	  content_type: { content_type: /\Aimage\/.*\Z/ },
	  size: { in: 0..10.megabytes }

  def name
    [first_name, last_name].join(' ')
  end

  
end
