class FigureTitle < ActiveRecord::Base
  # add many-to-many relationships here
  belongs_to :title
  belongs_to :figure
end
