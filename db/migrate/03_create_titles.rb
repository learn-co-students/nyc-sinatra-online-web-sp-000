class CreateTitles < ActiveRecord::Migration
  def change() create_table(:titles) {|t| t.string :name} end
end
