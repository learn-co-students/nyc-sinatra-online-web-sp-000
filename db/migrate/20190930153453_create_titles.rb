class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.text :name 
      t.integer :figure_titles_id
    end
  end
end
