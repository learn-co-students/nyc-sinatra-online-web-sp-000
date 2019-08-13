class FigureTitle < ActiveRecord::Base
  # add relationships here
  belongs_to :figure_id
  belongs_to :title_id
end
