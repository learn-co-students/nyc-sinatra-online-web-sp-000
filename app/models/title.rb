class Title < ActiveRecord::Base
  # add relationships here
  # A title has_many figure_titles and many figures through figure_titles.
  has_many :figure_titles
  has_many :figures, through: :figure_titles



end
