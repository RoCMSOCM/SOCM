#This cron job uses the Whenever gem to ping the site every 59 minutes
#so SOCM doesn't go idle on heroku's server
set :environment, 'production'

every 10.seconds do
  command "echo 'you can use raw cron syntax too'"
end
