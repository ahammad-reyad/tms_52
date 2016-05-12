require "rails_helper"
require "support/controller_helpers"

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include ControllerHelpers, type: :controller
end

RSpec.describe Admin::SubjectsController, type: :controller do
  fixtures :users
  fixtures :subjects
  before do
    @user1 = users(:user1)
    sign_in @user1
  end

  context "POST #create" do
    before do
      @valid_subject = {title: "new course",
      instruction: "new course"}
      @invalid_subject = {title: ""}
    end

    it "should increment Subject after create" do
      subject_count = Subject.all.count
      post :create, subject: @valid_subject
      expect(Subject.all.count).to eq(subject_count + 1)
    end
    it "should not increment Subject after creating invalid subject" do
      subject_count = Subject.all.count
      post :create, subject: @invalid_subject
      expect(Subject.all.count).not_to eq(subject_count + 1)
    end
    it "should redirect to root_url after create" do
      post :create, subject: @valid_subject
      expect(response).to redirect_to(root_url)
    end
    it "should render new after create invalid course" do
      post :create, subject: @invalid_subject
      expect(response).to redirect_to(root_url)
    end
  end

  context "PATCH #update (subject)" do
    before do
      @subject = Subject.create(title: "new subject",
      instruction: "new subject")
    end
    it "should update with valid value" do
      patch :update, id: @subject.id, subject: {title: "aaa"}
      expect(assigns(:subject).title).to eq("aaa")
    end
    it "should not update with invalid value" do
      befor_update = @subject
      patch :update, id: @subject.id, subject:{title: ""}
      expect(@subject).to eq(befor_update)
    end
    it "should redirect to admin_subjects_path after updating valid" do
      patch :update, id: @subject.id, subject: {title: "aaa"}
      expect(response).to redirect_to(admin_subjects_path)
    end
    it "should redirect to edit after updating invalid" do
      patch :update, id: @subject.id, subject:{title: ""}
      expect(response).to render_template("edit")
    end
  end

  context "delete #DESTROY" do
    it "should decrement Course after destroy" do
      subject_count = Subject.all.count
      delete_subject = subjects(:subject1)
      delete :destroy, id: delete_subject
      expect(Subject.all.count).to eq(subject_count - 1)
    end
    it "should redirect to admin_users_path after delete" do
      delete_subject = subjects(:subject1)
      delete :destroy, id: delete_subject
      expect(response).to redirect_to(admin_subjects_path)
    end
  end
end
