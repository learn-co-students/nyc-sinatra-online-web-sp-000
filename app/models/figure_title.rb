class FigureTitle < ActiveRecord::Base

    has_many :titles, through: :figures
    has_many :figures, through: :titles
    belongs_to :figure
    belongs_to :title

end
