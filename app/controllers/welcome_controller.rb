class WelcomeController < ApplicationController
  def index
    puts "current admin = #{current_admin.email}"
  end
end
