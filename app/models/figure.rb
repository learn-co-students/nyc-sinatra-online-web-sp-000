class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles
end


# figure = Figure.create(name: 'Qin Shi Huong')
# title = Title.find_or_create_by(name: 'Emperor')
# figure.figure_titles.build(title: title)
# figure.landmarks.build(name: 'The Great Wall of China', year_completed: 1666)
# figure.save