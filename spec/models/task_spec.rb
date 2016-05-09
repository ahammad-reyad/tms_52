require "rails_helper"

describe Task do
  subject {FactoryGirl.create :task}

  it "has a valid factory" do
    expect(FactoryGirl.create :task).to be_valid
  end

  it {is_expected.to be_an Task}
  it {expect validate_presence_of :title}
  it {expect validate_presence_of :subject_id}
  it {expect have_many :user_tasks}
  it {should belong_to :subject}
end
