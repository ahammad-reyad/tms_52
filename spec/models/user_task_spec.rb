require "rails_helper"

describe UserTask do
  subject {FactoryGirl.create :user_task}

  it "has a valid factory" do
    expect(FactoryGirl.create :user_task).to be_valid
  end

  it {is_expected.to be_an UserTask}
  it {should belong_to :user}
  it {should belong_to :user_subject}
  it {should belong_to :task}
end
