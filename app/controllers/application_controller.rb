class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 
  def after_sign_up_path_for(resource)
    new_user_profile_path
  end
    
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
    
end
