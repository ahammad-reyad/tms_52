class UserCourse < ActiveRecord::Base
  after_save :create_user_subjects
  belongs_to :user
  belongs_to :course
  belongs_to :trainee, class_name: User.name, foreign_key: :user_id
  has_many :user_subjects, dependent: :destroy

  scope :course_for_current_user, -> (user_id) {where user_id: user_id}

  def create_user_subjects
    subjects = self.course.subjects
    subjects.each do |subject|
      user_subject = UserSubject.where(user_course_id: self.id, user_id:
      self.user_id, subject_id: subject.id)
      if user_subject.blank?
        UserSubject.create(
          user_course_id: self.id,
          user_id: self.user_id,
          subject_id: subject.id,
          status: "Not Finish"
        )
      end
    end
  end
end
