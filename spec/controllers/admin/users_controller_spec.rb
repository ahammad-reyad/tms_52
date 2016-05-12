require "rails_helper"
require "support/controller_helpers"

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include ControllerHelpers, type: :controller
end

RSpec.describe Admin::UsersController, type: :controller do
  fixtures :users
  before do
    @user1 = users(:user1)
    sign_in @user1
  end

  context "POST #create" do
    before do
      @valid_user = {name: "Reyad",
      email: "reyad@gmail.com",
      password: "11111111"}
      @invalid_user = {name: "",
      email: ""}
    end

    it "should increment User after create" do
      user_count = User.all.count
      post :create, user: @valid_user
      expect(User.all.count).to eq(user_count + 1)
    end
    it "should not increment User after creating invalid user" do
      user_count = User.all.count
      post :create, user: @invalid_user
      expect(User.all.count).not_to eq(user_count + 1)
    end
    it "should redirect to admin_users_path after create" do
      post :create, user: @valid_user
      expect(response).to redirect_to(admin_users_path)
    end
    it "should render new after create invalid user" do
      post :create, user: @invalid_user
      expect(response).to render_template("new")
    end
  end

  context "PATCH #update (other user)" do
    before do
      @user = User.create(name: "Reyad",
      email: "reyad@gmail.com",
      password: "11111111")
    end
    it "should update with valid value" do
      patch :update, id: @user.id, user: {name: "Shec Framgia"}
      expect(assigns(:user).name).to eq("Shec Framgia")
    end
    it "should not update with invalid value" do
      befor_update = @user
      patch :update, id: @user.id, user:{name: "", email: ""}
      expect(@user).to eq(befor_update)
    end
    it "should redirect to users_path after updating valid" do
      patch :update, id: @user.id, user: {name: "Shec Framgia"}
      expect(response).to redirect_to(admin_users_path)
    end
    it "should redirect to users_path after updating valid" do
      patch :update, id: @user.id, user:{name: "", email: ""}
      expect(response).to render_template("edit")
    end
  end

  context "PATCH #update (self)" do
    it "should update with valid value" do
      patch :update, id: @user1.id, user: {name: "aaa"}
      expect(assigns(:user).name).to eq("aaa")
    end
    it "should not update with invalid value" do
      befor_update = @user1
      patch :update, id: @user1.id, user:{name: "", email: ""}
      expect(@user1).to eq(befor_update)
    end
    it "should redirect to users_path after updating valid" do
      patch :update, id: @user1.id, user: {name: "aaa"}
      expect(response).to redirect_to(admin_users_path)
    end
    it "should redirect to users_path after updating valid" do
      patch :update, id: @user1.id, user:{name: "", email: ""}
      expect(response).to render_template("edit")
    end
  end

  context "delete #DESTROY" do
    it "should decrement User after destroy" do
      user_count = User.all.count
      delete_user = users(:user2)
      delete :destroy, id: delete_user
      expect(User.all.count).to eq(user_count - 1)
    end
    it "should redirect to admin_users_path after delete" do
      delete_user = users(:user2)
      delete :destroy, id: delete_user
      expect(response).to redirect_to(admin_users_path)
    end
  end
end
