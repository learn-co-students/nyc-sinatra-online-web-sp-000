class CreateFigures < ActiveRecord::Migration[5.0]
  def change 
    create_table :figures do |t| 
      t.string :name
    end
  end
end
