class Vote < ActiveRecord::Base
	extend Enumerize
	
	belongs_to :user
	belongs_to :article

	enumerize :vote, in: [:like, :dislike]
end
