class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def create
    if @user.save
      flash[:success] = t "user.create_success"
      redirect_to admin_users_path
    else
      flash[:danger] = t "user.create_failure"
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :user_type
  end
end
