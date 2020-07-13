class CreateLandmarks < ActiveRecord::Migration
  def up
    create_table :landmarks do |t|
      t.string :name
      t.integer :year_completed
      t.integer :figure_id
    end

    create_table :figures do |t|
      t.string :name
    end

    create_table :titles do |t|
      t.string :name
    end


  end

  def down
    drop_table :landmarks
    drop_table :figures
    drop_table :titles
    drop_table :figure_titles
  end
end
