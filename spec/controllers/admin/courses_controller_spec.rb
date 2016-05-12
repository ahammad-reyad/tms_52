require "rails_helper"
require "support/controller_helpers"

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include ControllerHelpers, type: :controller
end

RSpec.describe Admin::CoursesController, type: :controller do
  fixtures :users
  fixtures :courses
  before do
    @user1 = users(:user1)
    sign_in @user1
    @subjects = Subject.all
  end

  context "POST #create" do
    before do
      @valid_course = {title: "new course",
      instruction: "new course",
      start_date: "27/11/2015",
      end_date: "27/11/2015",
      status: "Started"}
      @invalid_course = {title: ""}
    end

    it "should increment Course after create" do
      course_count = Course.all.count
      post :create, course: @valid_course
      expect(Course.all.count).to eq(course_count + 1)
    end
    it "should not increment Course after creating invalid course" do
      course_count = Course.all.count
      post :create, course: @invalid_course
      expect(Course.all.count).not_to eq(course_count + 1)
    end
    it "should redirect to root_url after create" do
      post :create, course: @valid_course
      expect(response).to redirect_to(root_url)
    end
    it "should render new after create invalid course" do
      post :create, course: @invalid_course
      expect(response).to redirect_to(root_url)
    end
  end

  context "PATCH #update (course)" do
    before do
      @course = Course.create(title: "new course",
      instruction: "new course",
      start_date: "27/11/2015",
      end_date: "27/11/2015",
      status: "Started")
    end
    it "should update with valid value" do
      patch :update, id: @course.id, course: {title: "aaa"}
      expect(assigns(:course).title).to eq("aaa")
    end
    it "should not update with invalid value" do
      befor_update = @course
      patch :update, id: @course.id, course:{title: ""}
      expect(@course).to eq(befor_update)
    end
    it "should redirect to admin_courses_path after updating valid" do
      patch :update, id: @course.id, course: {title: "aaa"}
      expect(response).to redirect_to(admin_courses_path)
    end
    it "should redirect to edit after updating invalid" do
      patch :update, id: @course.id, course:{title: ""}
      expect(response).to render_template("edit")
    end
  end

  context "delete #DESTROY" do
    it "should decrement Course after destroy" do
      course_count = Course.all.count
      delete_course = courses(:course1)
      delete :destroy, id: delete_course
      expect(Course.all.count).to eq(course_count - 1)
    end
    it "should redirect to admin_users_path after delete" do
      delete_course = courses(:course1)
      delete :destroy, id: delete_course
      expect(response).to redirect_to(admin_courses_path)
    end
  end
end
