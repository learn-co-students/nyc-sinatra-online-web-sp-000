class CreateLandmarks < ActiveRecord::Migration
  # raise 'Write CreateLandmarks migration here'

  def change
    create_table :landmarks do |s|
      s.string :name
      s.integer :figure_id
      s.integer :year_completed
    end
  end
end
