set :environment, "development"

1.month, at: "start of the month at 2am" do
  rake "supervisor:last_day_month_summary"
end

end
