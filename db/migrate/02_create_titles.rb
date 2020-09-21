class CreateTitles < ActiveRecord::Migration
    # raise 'Write Createtitles migration here'
    def change 
      create_table :titles do |t|
          t.string :name
        #   t.integer :figure_id
      end
    end
  end
  