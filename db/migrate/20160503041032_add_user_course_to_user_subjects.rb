class AddUserCourseToUserSubjects < ActiveRecord::Migration
  def change
    add_reference :user_subjects, :user_course, index: true, foreign_key: true
  end
end
