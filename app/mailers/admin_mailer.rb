class AdminMailer < ActionMailer::Base
  default from: 'millerd1@wit.edu'

  def welcome_email(user)
    @admin = current_admin
    @url  = 'http://www.socm.herokuapp.com'
    mail(to: @admin.email, subject: 'Welcome to SOCM as a site admin.')
  end

  def new_admin_waiting_for_approval(admin)
    @admin = admin
    mail
  end
end
