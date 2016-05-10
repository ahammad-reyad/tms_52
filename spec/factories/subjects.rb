require "faker"

FactoryGirl.define do
  factory :subject do
    title {Faker::Name.title}
    instruction {Faker::Lorem.sentence}
  end
end
