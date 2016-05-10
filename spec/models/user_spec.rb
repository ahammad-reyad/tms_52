require "rails_helper"

describe User do
  subject {FactoryGirl.create :user}

  it "has a valid factory" do
    expect(FactoryGirl.create :user).to be_valid
  end

  it {is_expected.to be_an User}
  it {expect validate_presence_of :name}
  it {expect validate_presence_of :email}
  it {expect validate_presence_of :encrypted_password}
  it {expect have_many :activities}
  it {expect have_many :user_courses}
  it {expect have_many :user_subjects}
  it {expect have_many :user_tasks}
  it {expect have_many :supervisor_courses}
  it {expect have_many :courses}
end
