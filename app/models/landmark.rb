class Landmark < ActiveRecord::Base
  # `belongs_to` will always need a singular table name: like figure, not figures
  belongs_to :figure 
end
