class Course < ActiveRecord::Base
  has_many :course_subjects, dependent: :destroy
  has_many :supervisor_courses, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :trainers, through: :supervisor_courses, class_name: User.name
  has_many :subjects, through: :course_subjects
  has_many :trainees, through: :user_courses, class_name: User.name

  validates :title, presence: true
  validates :instruction, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true

  accepts_nested_attributes_for :course_subjects, reject_if:
    lambda {|attribute| attribute[:subject_id].blank?}, allow_destroy: true

  accepts_nested_attributes_for :supervisor_courses, reject_if:
    lambda {|attribute| attribute[:user_id].blank?}, allow_destroy: true

  accepts_nested_attributes_for :user_courses, reject_if:
    lambda {|attribute| attribute[:user_id].blank?}, allow_destroy: true

  scope :active, -> {where "status = ?", "Started"}
end
