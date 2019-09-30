class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |t|
      t.text :name 
      t.integer :figure_titles_id
    end
  end
end
