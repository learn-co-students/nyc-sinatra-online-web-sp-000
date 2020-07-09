class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |t|
      t.string :name
      t.string :landmark_id
      t.string :title_id
    end
  end
end
