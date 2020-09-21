class CreateFigureTitles < ActiveRecord::Migration
    # raise 'Write Createfigure_titles migration here'
    def change 
      create_table :figure_titles do |t|
        t.integer :figure_id
        t.integer :title_id
      end
    end
end
  