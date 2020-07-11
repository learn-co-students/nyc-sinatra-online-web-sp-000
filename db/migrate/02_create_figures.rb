class CreateFigures < ActiveRecord::Migration

  def change
    create_table :figures do |a|
      a.string :name
    end
  end

end
