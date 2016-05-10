require "rails_helper"

describe Subject, type: :model do
  subject {FactoryGirl.create :subject}

  it "has a valid factory" do
    expect(FactoryGirl.create :subject).to be_valid
  end

  it {is_expected.to be_an Subject}
  it {expect validate_presence_of :title}
  it {expect validate_presence_of :instruction}
  it {expect have_many :tasks}
  it {expect have_many :course_subjects}
  it {expect have_many :user_subjects}
  it {expect have_many :courses}
  it {should accept_nested_attributes_for :tasks}

  it "reject if task title blank test" do
    tasks = Subject.nested_attributes_options[:tasks]
    expect(tasks[:reject_if].call({title: ""})).to be true
  end
end
