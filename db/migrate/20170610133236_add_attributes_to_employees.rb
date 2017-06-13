class AddAttributesToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :available_vacation, :integer
    add_column :employees, :taken_vacation, :integer
  end
end
