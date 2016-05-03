class Subject < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :courses, through: :course_subjects

  accepts_nested_attributes_for :tasks, reject_if:
   lambda {|attribute| attribute[:title].blank?}, allow_destroy: true

  validates :title, presence: true
  validates :instruction, presence: true
end
