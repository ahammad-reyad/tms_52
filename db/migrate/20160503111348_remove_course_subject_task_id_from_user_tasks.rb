class RemoveCourseSubjectTaskIdFromUserTasks < ActiveRecord::Migration
  def change
    remove_column :user_tasks, :course_subject_task_id, :integer
  end
end
