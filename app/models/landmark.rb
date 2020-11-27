class Landmark < ActiveRecord::Base
  # add relationships here
  belongs_to :figure

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Landmark.all.find{|landmark| landmark.slug == slug}
  end

end
