require_relative './concerns/slugifiable.rb'

class Figure < ActiveRecord::Base
  # add relationships here
  include Slugifiable::InstanceMethod
  extend Slugifiable::ClassMethod
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles
end
