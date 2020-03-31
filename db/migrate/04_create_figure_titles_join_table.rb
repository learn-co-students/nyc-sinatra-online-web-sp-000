class CreateFigureTitlesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :figure, :titles do |t|
      t.index :title_id 
      t.index :figure_id
    end 
  end
end
