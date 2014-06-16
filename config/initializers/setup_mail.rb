ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "",
  :port => 1,
  :domain => "",
  :user_name => "",
  :password => "",
  :authentication => "plain",
  :enable_starttls_auto => true
}
