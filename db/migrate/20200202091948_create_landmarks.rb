class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :lendmarks do |t|
      t.string :name
      t.integer :year_completed
      t.integer :figure_id
    end
  end
end
