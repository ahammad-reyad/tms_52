class UserCoursesController < ApplicationController
  load_and_authorize_resource
  def index
    @user_courses = UserCourse.course_for_cuuent_user current_user.id
  end
end
