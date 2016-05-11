require "faker"

FactoryGirl.define do
  factory :user_task do
    user
    user_subject
    task
  end
end
