class FigureTitle < ActiveRecord::Base
  has_many :figures
  has_many :titles
end
