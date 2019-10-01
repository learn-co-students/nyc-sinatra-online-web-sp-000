class CreateFigures < ActiveRecord::Migration

    def change
      create_table :figures do |l|
        l.string :name
      end
    end

end
