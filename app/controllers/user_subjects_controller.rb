class UserSubjectsController < ApplicationController
  def update
    user_subject = UserSubject.find params[:id]
    if user_subject.update_attributes user_subject_params
      flash[:success] = t ".success"
    else
      flash[:warning] = t ".failed"
    end
    redirect_to current_user
  end

  private
  def user_subject_params
    params.require(:user_subject).permit :user_id, :user_course_id, :subject_id,
      :status, user_tasks_attributes: [:user_subject_id, :user_id, :task_id, :status]
  end
end
