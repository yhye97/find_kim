class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
   
   protected
    helper :all 

   
  def configure_permitted_parameters
    additional_params = [:name, :tel, :nickname, :profile_img]
    devise_parameter_sanitizer.permit(:sign_up, keys: additional_params)
    
    update_params = [:name, :tel, :nickname, :profile_img, :current_password, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:account_update, keys: update_params)
    
  end
  
  
end
