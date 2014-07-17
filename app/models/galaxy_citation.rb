class GalaxyCitation < ActiveRecord::Base
  belongs_to :galaxy
  belongs_to :citation
end
