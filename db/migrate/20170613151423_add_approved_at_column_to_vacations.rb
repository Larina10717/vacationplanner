class AddApprovedAtColumnToVacations < ActiveRecord::Migration[5.0]
  def up 
    add_column :vacations, :approved_at, :date
  end

  def down
    remove_column :vacations, :approved_at, :date
  end
end
