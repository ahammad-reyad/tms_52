class SupervisorCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :trainer, class_name: User.name, foreign_key: :user_id
end
