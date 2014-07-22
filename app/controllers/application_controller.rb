class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #TODO: Uncomment when we merge the rest of the admin changes into master
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_headers
  before_action :set_admin_unapproved_count

  private
    def set_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Expose-Headers'] = 'Etag'
      headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, PATCH, OPTIONS, HEAD'
      headers['Access-Control-Allow-Headers'] = '*, x-requested-with, Content-Type, If-Modified-Since, If-None-Match'
      headers['Access-Control-Max-Age'] = '86400'
    end

    def set_admin_unapproved_count
      @unapproved_admin_count = Admin.where(:approved => nil).count
    end
end
