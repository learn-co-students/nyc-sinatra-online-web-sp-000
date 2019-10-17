class Figure < ActiveRecord::Base
  # add relationships here
  has_many :landmarks
end
