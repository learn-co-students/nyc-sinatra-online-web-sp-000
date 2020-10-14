class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do |t|
      t.string :figure_id
      t.string :title_id
    end
  end
end