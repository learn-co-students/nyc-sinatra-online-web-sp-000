class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :landmarks, :year_conpleted, :year_completed
  end
end
