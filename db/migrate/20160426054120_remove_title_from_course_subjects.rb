class RemoveTitleFromCourseSubjects < ActiveRecord::Migration
  def change
    remove_column :course_subjects, :title, :string
  end
end
