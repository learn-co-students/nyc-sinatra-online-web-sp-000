class Landmark < ActiveRecord::Base
  # add relationships here
  has_many :figures
  has_many :titles, through: :figures
  belongs_to :figure
end
