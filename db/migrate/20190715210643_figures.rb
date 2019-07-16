class Figures < ActiveRecord::Migration
  def change
    create_table :figures do |t| 
      t.integer :user_id 
      t.string :name 
    end 
  end
end
