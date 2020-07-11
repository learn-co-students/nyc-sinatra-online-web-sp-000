class CreateTitles < ActiveRecord::Migration

  def change
    create_table :titles do |a|
      a.string :name
    end
  end

end
