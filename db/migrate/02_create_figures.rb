class CreateFigures < ActiveRecord::Migration
     raise 'Write CreateFigures migration here'
     def change
       create_table :figures do |t|
         t.string :name
         
         
       end
     end
   end