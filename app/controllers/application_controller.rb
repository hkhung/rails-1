class ApplicationController < ActionController::Base 
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
	rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end


	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) << :first_name
		devise_parameter_sanitizer.for(:account_update) << :first_name
		devise_parameter_sanitizer.for(:sign_up) << :last_name
		devise_parameter_sanitizer.for(:account_update) << :last_name
		devise_parameter_sanitizer.for(:sign_up) << :image
		devise_parameter_sanitizer.for(:account_update) << :image
		devise_parameter_sanitizer.for(:admin) << :admin
	end
end
