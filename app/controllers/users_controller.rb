class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :get_user_courses_and_tasks, only: [:show]

  def index
    @user_courses = UserCourse.course_for_cuuent_user current_user.id
  end

  private
  def get_user_courses_and_tasks
    @user_courses = @user.user_courses
    @active_user_course = @user_courses.current_active_course Course.active.first.id
    @user_tasks = UserTask.task_for_current_user current_user
    @activities = User.user_activity current_user
  end
end
