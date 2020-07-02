class CreateFigureTitles < ActiveRecord::Migration

  def change
    create_table :figure_titles do |a|
      a.integer :title_id
      a.integer :figure_id
    end
  end
end
