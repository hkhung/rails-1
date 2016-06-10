Rails.application.routes.draw do 
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :articles do
  	member do
  		post 		:like
  		post 		:dislike
  		delete 	:unvote
  	end
  end

 	get 	'users', to: 'users#index' 
  root 	'articles#index'
end
