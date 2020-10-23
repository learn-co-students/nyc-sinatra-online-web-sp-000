require_relative './concerns/slugifiable.rb'

class Landmark < ActiveRecord::Base
  # add relationships here
  include Slugifiable::InstanceMethod
  extend Slugifiable::ClassMethod
  belongs_to :figure
end
