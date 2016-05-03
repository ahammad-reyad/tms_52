class AddTaskToUserTasks < ActiveRecord::Migration
  def change
    add_reference :user_tasks, :task, index: true, foreign_key: true
  end
end
