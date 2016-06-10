class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new
		if user.admin?
			can :manage, :all
		else
			can :update, Article do |article|
				article.author == user 
			end

			can :destroy, Article do |article|
				article.author == user
			end

			can :create, Article
		end

	end
end
