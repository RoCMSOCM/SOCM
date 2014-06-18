class Citation < ActiveRecord::Base
  # This class will be responsible for storing citation information 
  # for a paraticular measurement. To make this simple using 
  # https://github.com/inukshuk/csl-ruby may help

   belongs_to :measurement
end
