class Landmark < ActiveRecord::Base
  belongs_to :figure
  has_many :landmark
end
