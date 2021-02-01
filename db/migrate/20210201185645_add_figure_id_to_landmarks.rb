class AddFigureIdToLandmarks < ActiveRecord::Migration
  def change
    change_table :landmarks do |t|
      t.integer :figure_id
    end
  end
end
