class Admin::CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :load_subjects, only: [:new, :edit]

  def index
  end

  def new
  end

  def create
    if @course.save
      flash[:success] = t "course.create_success"
    else
      flash[:danger] = t "course.create_failure"
    end
    redirect_to root_url
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t "course.update_success"
      redirect_to admin_courses_path current_user
    else
      flash[:danger] = t "course.update_failure"
      render "edit"
    end
  end

  def destroy
    @course.destroy
    flash[:success] = t "course.delete_success"
    redirect_to admin_courses_path
  end

  private
  def course_params
    params.require(:course).permit :title, :instruction, :start_date, :end_date, :status,
      course_subjects_attributes: [:id, :course_id, :subject_id, :_destroy]
  end

  def load_subjects
    Subject.all.each do |subject|
      @course.course_subjects.new subject: subject unless @course.subjects.include? subject
    end
  end
end
