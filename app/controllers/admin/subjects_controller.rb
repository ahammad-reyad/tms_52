class Admin::SubjectsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @subject.save
      flash[:success] = t "subject.create_success"
    else
      flash[:danger] = t "subject.create_failure"
    end
    redirect_to root_url
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t "subject.update_success"
      redirect_to admin_subjects_path
    else
      flash.now[:danger] = t "subject.update_failure"
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] = t "subject.delete_success"
      redirect_to admin_subjects_path
    end
  end

  private
  def subject_params
    params.require(:subject).permit :title, :instruction,
      tasks_attributes: [:id, :subject_id, :title, :_destroy]
  end
end
