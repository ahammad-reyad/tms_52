class AddJoinedToUserCourses < ActiveRecord::Migration
  def change
    add_column :user_courses, :joined, :boolean, default: false
  end
end
