class FigureTitle < ActiveRecord::Base
  # add relationships here
  belongs_to :figures
  belongs_to :titles
end
