class Landmark < ActiveRecord::Base
  belongs_to :figure

  has_many :figure_titles
  has_many :titles, through: :figure_titles
end
