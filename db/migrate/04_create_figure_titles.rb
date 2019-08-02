class CreateFigureTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :figure_titles do |t|
      t.references :title, index: true, foreign_key: true
      t.references :figure, index: true, foreign_key: true
    end
  end
end
