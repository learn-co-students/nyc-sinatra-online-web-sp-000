class Landmark < ActiveRecord::Base
  # add relationships here
  # A Landmark belongs_to a figure and a figure has_many landmarks.
  belongs_to :figure

end
