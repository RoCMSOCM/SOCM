#cron for pinging server every 59 minutes
every 1.minutes do
  command "curl http://socm.herokuapp.com"
end
