class TraineeMailer < ApplicationMailer
  def assign_trainee_to_course trainee, course
    @trainee = trainee
    @course = course
    mail to: @trainee.email, subject: Setting.email_subject.assigned_to_course
  end

  def remove_trainee_from_course trainee, course
    @trainee = trainee
    @course = course
    mail to: @trainee.email, subject: Setting.email_subject.removed_from_course
  end
end
