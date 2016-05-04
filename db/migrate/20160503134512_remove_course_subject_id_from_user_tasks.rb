class RemoveCourseSubjectIdFromUserTasks < ActiveRecord::Migration
  def change
    remove_column :user_tasks, :course_subject_id, :integer
  end
end
