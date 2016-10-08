class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :set_layout
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def set_layout
    if user_signed_in?
      'application'
    else
      'unauthenticated'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  end
end
