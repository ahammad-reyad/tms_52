class Admin::SupervisorCoursesController < ApplicationController
  load_and_authorize_resource
  before_action :load_users

  private
  def load_users
    @course = Course.find params[:course_id]
    User.supervisor.each do |supervisor|
      @course.supervisor_courses.new user: supervisor unless @course.trainers.include? supervisor
    end
  end
end
