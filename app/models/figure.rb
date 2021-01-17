class Figure < ActiveRecord::Base
  # add relationships here
  has_many :landmarks 
  has_many :titles 
end
