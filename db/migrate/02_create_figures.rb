class CreateFigures < ActiveRecord::Migration
  def change() create_table(:figures) {|t| t.string :name} end
end
