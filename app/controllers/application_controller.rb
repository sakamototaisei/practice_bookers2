class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about, :new_guest]
  before_action :configuer_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  protected

  def configuer_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
