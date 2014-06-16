class AdminController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:approved] == "false"
       @admins = Admin.where(:approved => nil)
    else
      @admins = Admin.all
    end
  end
end
