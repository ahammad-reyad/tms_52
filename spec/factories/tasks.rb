require "faker"

FactoryGirl.define do
  factory :task do
    title {Faker::Name.name}
    subject
  end
end
