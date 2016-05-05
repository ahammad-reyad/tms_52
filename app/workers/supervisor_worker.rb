class SupervisorWorker
  include Sidekiq::Worker

  MONTHLY_REPORT = 1
  COURSE_FINISH = 2

  def perform action
    case action
    when MONTHLY_REPORT
      send_email_monthly_report
  end

  private
  def send_email_monthly_report
    @supervisors = User.find_supervisors
    @supervisors.each do |supervisor|
      SupervisorMailer.last_day_month_summary(supervisor).deliver
    end
  end
end
