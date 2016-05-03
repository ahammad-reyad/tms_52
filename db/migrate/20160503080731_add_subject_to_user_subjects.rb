class AddSubjectToUserSubjects < ActiveRecord::Migration
  def change
    add_reference :user_subjects, :subject, index: true, foreign_key: true
  end
end
