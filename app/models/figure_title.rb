require_relative 'concerns/slugifiable.rb'

class FigureTitle < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  belongs_to :figure
  belongs_to :title
end
