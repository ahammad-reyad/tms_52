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

  def update
    if @user.update_attributes user_params
      flash[:success] = t "user.update_success"
      redirect_to admin_users_path
    else
      flash[:danger] = t "user.update_failure"
      render "edit"
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "user.delete_success"
    redirect_to admin_users_path
  end


  private
  def user_params
    params.require(:user).permit :name, :email, :password, :user_type
  end
end
