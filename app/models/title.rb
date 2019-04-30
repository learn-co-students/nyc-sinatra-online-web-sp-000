require_relative './concerns/slugifiable.rb'

class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :figures, through: :figure_titles

  include Slugifiable
  extend Slugifiable
end
