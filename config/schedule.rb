#This cron job uses the Whenever gem to ping the site every 59 minutes
#so SOCM doesn't go idle on heroku's server
set :environment, 'production'

every 10.seconds do
  puts "ran it at #{Time.now}", environment => "production"
end
