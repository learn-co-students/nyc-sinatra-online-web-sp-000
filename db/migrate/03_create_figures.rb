class CreateFigures < ActiveRecord::Migration
    # raise 'Write Createfigures migration here'
    def change 
      create_table :figures do |t|
          t.string :name
        #   t.integer :figure_id
      end
    end
end
  