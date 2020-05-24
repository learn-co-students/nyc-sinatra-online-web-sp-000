class Figure < ActiveRecord::Base
  # add relationships here
  has_many(:title_figures)
  has_many(:landmarks)
  has_many(:titles, through: :title_figures)
end
