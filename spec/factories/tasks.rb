require "faker"

FactoryGirl.define do
  factory :task do
    title {Faker::Name.name}
    subject_id {Faker::Number.number(2)}
  end
end
