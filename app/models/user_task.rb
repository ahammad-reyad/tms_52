class UserTask < ActiveRecord::Base
  include PublicActivity::Model
  tracked recipient: ->(controller, model) {model && model.user}
  belongs_to :user
  belongs_to :user_subject
  belongs_to :task

  scope :task_for_current_user, -> (current_user) {where user_id: current_user.id}
end
