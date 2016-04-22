class Users::RegistrationsController < Devise::RegistrationsController
  before_action :setup_sign_up_params, only: :create

  def new
    super
  end

  def create
    super
  end

  private
  def setup_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
