class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :title, through: :figure_titles
end
