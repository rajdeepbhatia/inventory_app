class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :set_layout

  def set_layout
    if user_signed_in?
      'application'
    else
      'unauthenticated'
    end
  end
end
