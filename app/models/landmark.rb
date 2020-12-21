class Landmark < ActiveRecord::Base
  # add relationships here
  #belongs to a figure
  belongs_to :figure
  has_many :titles, through: :figures
end
