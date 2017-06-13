class AddAttributesToVacations < ActiveRecord::Migration[5.0]
  def change
    add_column :vacations, :pending, :boolean
    add_column :vacations, :approved, :boolean
    add_column :vacations, :declined, :boolean
  end
end
