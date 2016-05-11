require "faker"

FactoryGirl.define do
  factory :user_subject do
    user_course
    subject
    status {"Not Finish"}
  end
end
