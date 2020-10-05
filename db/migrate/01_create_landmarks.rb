class CreateLandmarks < ActiveRecord::Migration
  create_table :landmarks do |t|
    t.string :name
    t.integer :date
    t.integer :figure_id
  end
end
