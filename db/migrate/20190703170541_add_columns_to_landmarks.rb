class AddColumnsToLandmarks < ActiveRecord::Migration
  def change
    add_column :landmarks, :year_completed, :integer
    add_column :landmarks, :figure_id, :integer
  end
end
