class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication
  before_action :setup_sign_up_params, only: :create
  before_action :setup_account_update_params, only: :update

  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end

  private
  def setup_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def setup_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def update_resource resource, params
    resource.update_without_password(params)
  end

  def sign_up resource_name, resource
  end
end
