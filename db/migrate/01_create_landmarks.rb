class CreateLandmarks < ActiveRecord::Migration
  # raise 'Write CreateLandmarks migration here'
  def change
    create_table :landmarks do |l|
      l.string :name
      l.integer :year_completed
      l.integer :figure_id 
    end
  end
end
