class AddInitialVelocityToOrbits < ActiveRecord::Migration[5.1]
  def change
    add_column :orbits, :initial_velocity, :decimal
  end
end
