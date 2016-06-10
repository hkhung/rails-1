Rails.application.routes.draw do 
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :articles, :article_users 
 	get 	'/users', to: 'users#index'
  root 	'articles#index'
end
