class CreateFigureTitlesJoinTable < ActiveRecord::Migration
  def change
      create_table :figure_titles, id: false do |t|
        t.integer :title_id
        t.integer :figure_id
    end
  end
end
