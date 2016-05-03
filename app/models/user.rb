class User < ActiveRecord::Base
  has_many :activities, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :supervisor_courses, dependent: :destroy
  has_many :courses, through: :user_courses, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  enum user_type: {admin: 0, supervisor: 1, trainee: 2}
end
