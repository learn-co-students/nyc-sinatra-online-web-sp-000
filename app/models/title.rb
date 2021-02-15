class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :figures, through: :figure_titles

  # def slug
  #   name.downcase.gsub(" ", "-")
  # end

  # def self.find_by_slug(slug)
  #   Title.all.find{ |title| title.slug == slug}

  # end

end
