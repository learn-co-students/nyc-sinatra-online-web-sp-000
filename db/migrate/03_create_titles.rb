class CreateTitles < ActiveRecord::Migration

    def change
      create_table :titles do |l|
        l.string :name
      end
    end

end
