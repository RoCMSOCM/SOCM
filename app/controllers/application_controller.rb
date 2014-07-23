class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
