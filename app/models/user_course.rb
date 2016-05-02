class UserCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :trainee, class_name: User.name, foreign_key: :user_id

  scope :course_for_cuuent_user, -> (user_id) {where user_id: user_id}
end
