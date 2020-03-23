class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |t|
      t.string :name
      t.integer :year_completed
      t.integer :figure_id
    end
  end
end
