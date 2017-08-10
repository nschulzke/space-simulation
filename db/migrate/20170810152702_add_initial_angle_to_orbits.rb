class AddInitialAngleToOrbits < ActiveRecord::Migration[5.1]
  def change
    add_column :orbits, :initial_angle, :decimal, default: 0
  end
end
