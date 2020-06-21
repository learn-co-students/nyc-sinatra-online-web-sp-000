require_relative "concerns/slugifiable"

class FigureTitle < ActiveRecord::Base
  belongs_to :title
  belongs_to :figure
end
