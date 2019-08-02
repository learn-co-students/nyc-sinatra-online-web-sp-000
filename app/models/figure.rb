class Figure < ActiveRecord::Base
  # add relationships here
  has_many :landmarks, :dependent => :destroy
  has_many :figure_titles, :dependent => :destroy
  has_many :titles, through: :figure_titles

  include ApplicationRecord
end
