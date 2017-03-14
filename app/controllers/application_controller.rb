class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_params, if: :devise_controller?
  def configure_permitted_params
   devise_parameter_sanitizer.permit(:sign_up) {
    |u| u.permit(:email, :password, :name, :image, :conpany_id)
   }
  end
  def after_sign_in_path_for(resource)
    case resource
    when User
      root_path
    when AdminUser
      root_path
    end
  end


  def after_sign_out_path_for(resource)
  if resource == :user
    new_user_session_path
  elsif resource == :admin_user
    new_admin_user_session_path
  else
    root_path
  end
end


end
