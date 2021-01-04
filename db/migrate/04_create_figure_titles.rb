class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do |t|
      t.belongs_to :title
      t.belongs_to :figure
    end
  end
end
