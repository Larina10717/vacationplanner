class AddEmployeeRefToVacations < ActiveRecord::Migration[5.0]
  def change
    add_reference :vacations, :employee, foreign_key: true
  end
end
