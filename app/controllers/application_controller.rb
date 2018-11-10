class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :dob])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :dob])
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root_path
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
  end

end
