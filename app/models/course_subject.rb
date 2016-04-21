class CourseSubject < ActiveRecord::Base
  belongs_to :subject
  belongs_to :course
  has_many :course_subject_tasks, dependent: :destroy
end
