class ApplicationController < ActionController::Base
  before_action :configuer_permitted_parameters, if: :devise_controller?

  def after_sign_in_path(resource)
    user_path(resource)
  end

  protected

  def configuer_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
