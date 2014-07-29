#cron for pinging server every 59 minutes
every '* * * * *' do
  command "curl http://socm.herokuapp.com"
end
