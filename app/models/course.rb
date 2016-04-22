class Course < ActiveRecord::Base
  has_many :course_subjects, dependent: :destroy
  has_many :supervisor_courses, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :trainers, through: :supervisor_courses, class_name: User.name
  has_many :subjects, through: :course_subjects
  has_many :trainees, through: :user_courses, class_name: User.name
end
