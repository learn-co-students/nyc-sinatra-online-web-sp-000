module Slugifiable
  def slug
    return self.name.downcase.gsub(' ','-').gsub(/[^\w-]/,'')
  end

  def find_by_slug(text)
    self.all.detect {|instance| instance.slug == text}
  end
end
