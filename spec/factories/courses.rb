require "faker"

FactoryGirl.define do
  factory :course do
    title {Faker::Name.name}
    instruction {Faker::Name.name}
    end_date {Faker::Time.forward(23)}
    start_date {Faker::Time.backward(23)}
    status {"Not started"}
  end
end
