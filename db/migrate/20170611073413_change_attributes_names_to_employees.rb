class ChangeAttributesNamesToEmployees < ActiveRecord::Migration[5.0]
  def change
    rename_column :employees, :taken_vacation, :taken_vacation_days
    rename_column :employees, :available_vacation, :available_vacation_days
  end
end
