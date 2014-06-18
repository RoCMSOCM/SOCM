class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #TODO: Uncomment when we merge the rest of the admin changes into master
  #before_action :authenticate_admin!, except: [:index, :show]
end
