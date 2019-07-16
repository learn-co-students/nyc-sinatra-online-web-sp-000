class Landmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t| 
      t.integer :user_id 
      t.string :name 
      t.integer :figure_id 
      t.integer :year_completed 
    end 
  end
end
