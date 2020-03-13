require_relative 'concerns/slugifiable.rb'

class Figure < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles
end
