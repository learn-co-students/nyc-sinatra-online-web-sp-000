require_relative "concerns/slugifiable"

class Landmark < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  belongs_to :figure
end
