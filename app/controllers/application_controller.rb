class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions
  rescue_from CanCan::AccessDenied do |exception|
    flash[:danger] = I18n.t :access_denied
    redirect_to root_path
  end
end
