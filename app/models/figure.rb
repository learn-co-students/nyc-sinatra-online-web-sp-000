class Figure < ActiveRecord::Base
  # add relationships here
  has_many :landmarks
  has_many :figure_titles through => :titles
end
