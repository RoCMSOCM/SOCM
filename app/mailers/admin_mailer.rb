class AdminMailer < ActionMailer::Base
  default from: 'millerd1@wit.edu'

  def welcome_email(admin)
    @url  = 'http://www.socm.herokuapp.com'
    mail(to: @admin.email, subject: 'Welcome to SOCM as a site admin.')
  end

  def new_admin_waiting_for_approval(admin)
    @admin = admin
    welcome_email(admin)
    mail
  end
end
