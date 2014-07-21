class AdminMailer < ActionMailer::Base
  default from: 'socm.herokuapp.com'

  def welcome_email(admin)
    @url  = 'http://localhost:3000/admins/sign_in'
    mail(to: @admin.email, subject: 'Welcome to SOCM as a site admin.')
  end

  def new_admin_waiting_for_approval(admin)
    @admin = admin
    welcome_email(admin)
    mail
  end
end
