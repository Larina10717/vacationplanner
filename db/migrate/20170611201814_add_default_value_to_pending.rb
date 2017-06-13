class AddDefaultValueToPending < ActiveRecord::Migration[5.0]
  def up
    change_column :vacations, :pending, :boolean, default: true
  end

  def down
    change_column :vacations, :pending, :boolean, default: nil
  end
end
