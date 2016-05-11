require "rails_helper"

describe UserSubject do
  subject {FactoryGirl.create :user_subject}

  it "has a valid factory" do
    expect(FactoryGirl.create :user_subject).to be_valid
  end

  it {is_expected.to be_an UserSubject}
  it {expect validate_presence_of :title}
  it {expect validate_presence_of :subject_id}
  it {expect have_many :user_tasks}
  it {should belong_to :user}
  it {should belong_to :user_course}
  it {should belong_to :subject}

  it "reject if user subject id blank test" do
    tasks = UserSubject.nested_attributes_options[:user_tasks]
    expect(tasks[:reject_if].call({user_subject_id: ""})).to be true
  end
end
