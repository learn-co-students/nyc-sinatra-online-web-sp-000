class Title < ActiveRecord::Base
  has_many :figure_title
  has_many :figures, through: :figure_title
end
