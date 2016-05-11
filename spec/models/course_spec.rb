require "rails_helper"

describe Course, type: :model do
  subject {FactoryGirl.create :course}

  it "has a valid factory" do
    expect(FactoryGirl.create :course).to be_valid
  end

  it {is_expected.to be_an Course}
  it {expect validate_presence_of :title}
  it {expect validate_presence_of :instruction}
  it {expect validate_presence_of :start_date}
  it {expect validate_presence_of :end_date}
  it {expect validate_presence_of :instruction}

  it {expect have_many :course_subjects}
  it {expect have_many :supervisor_courses}
  it {expect have_many :user_courses}
  it {expect have_many :trainers}
  it {expect have_many :subjects}
  it {expect have_many :trainees}

  it "reject if task subject id blank test" do
    tasks = Course.nested_attributes_options[:course_subjects]
    expect(tasks[:reject_if].call({subject_id: ""})).to be true
  end

  it "reject if task user id blank test" do
    tasks = Course.nested_attributes_options[:supervisor_courses]
    expect(tasks[:reject_if].call({user_id: ""})).to be true
  end

  it "reject if task subject id blank test" do
    tasks = Course.nested_attributes_options[:user_courses]
    expect(tasks[:reject_if].call({user_id: ""})).to be true
  end
end
