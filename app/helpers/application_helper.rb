module ApplicationHelper
  def full_title page_title = ""
    base_title = t "app_name"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def datetime date
    I18n.l date.to_date
  end

  def find_user_task user_subject, task
    user_subject.user_tasks.find_by task_id: task.id
  end
end
