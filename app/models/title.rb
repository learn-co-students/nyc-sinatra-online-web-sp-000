class Title < ActiveRecord::Base
  # add relationships here
  # many to many relationship with figures.
  has_many :figure_titles
  has_many :figures, through: :figure_titles
end
