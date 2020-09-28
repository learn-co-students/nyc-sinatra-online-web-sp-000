class FiguresTitles < ActiveRecord::Migration
     raise 'Write Create FiguresTitles migration here'
     def change
       create_table :figures_ do |t|
         t.string :name
         
         
       end
     end
   end