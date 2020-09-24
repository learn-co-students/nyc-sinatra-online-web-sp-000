class AddFigureIdToLandmarrks < ActiveRecord::Migration
  def change
    add_column :landmarks, :figure_id, :integer
  end
end
