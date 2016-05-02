class UserCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :trainee, class_name: User.name, foreign_key: :user_id
end
