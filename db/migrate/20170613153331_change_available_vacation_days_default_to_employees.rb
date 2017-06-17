class ChangeAvailableVacationDaysDefaultToEmployees < ActiveRecord::Migration[5.0]
  def up
    change_column :employees, :available_vacation_days, :integer, default: 24
  end

  def down
    change_column :employees, :available_vacation_days, :integer
  end 
end
