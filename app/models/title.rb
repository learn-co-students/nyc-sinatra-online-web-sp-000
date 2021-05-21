class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :titles, through: :figure_titles
  # add relationships here
end
