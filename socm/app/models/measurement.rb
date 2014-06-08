class Measurement < ActiveRecord::Base
  #attr_protected :galaxy_id

  belongs_to :galaxy
end
