class Admin::SubjectsController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    if @subject.save
      flash[:success] = t "subject.create_success"
      redirect_to root_url
    else
      flash[:danger] = t "subject.create_failure"
      redirect_to root_url
    end
  end

  private
  def subject_params
    params.require(:subject).permit :title, :instruction,
      tasks_attributes: [:id, :subject_id, :title, :_destroy]
  end
end
