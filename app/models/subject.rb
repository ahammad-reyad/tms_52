class Subject < ActiveRecord::Base
  has_many :task, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :courses, through: :course_subjects
end
