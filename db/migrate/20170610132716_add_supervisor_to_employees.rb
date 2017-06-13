class AddSupervisorToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :supervisor, :boolean, default: false
  end
end
