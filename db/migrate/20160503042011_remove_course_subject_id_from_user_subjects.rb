class RemoveCourseSubjectIdFromUserSubjects < ActiveRecord::Migration
  def change
    remove_column :user_subjects, :course_subject_id, :integer
  end
end
