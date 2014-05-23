class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	# devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :first_name, :last_name, :password, :password_confirmation => []) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :first_name, :last_name, :email,  :current_password, :password, :password_confirmation => []) }
  end

  def after_sign_in_path_for(resource)
    case resource
    when User then root_path
    when Admin then show_registrations_path
    end
  end
end
