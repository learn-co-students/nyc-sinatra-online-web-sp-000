class RenameColumnDateToYearCompleted < ActiveRecord::Migration
    rename_column :landmarks, :date, :year_completed
end