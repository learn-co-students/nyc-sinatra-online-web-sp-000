class FigureTitle < ActiveRecord::Base

  belongs_to :titles
  belongs_to :figures
end
