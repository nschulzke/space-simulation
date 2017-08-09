class CreateOrbits < ActiveRecord::Migration[5.1]
  def change
    create_table :orbits do |t|
      t.references :orbitable, polymorphic: true, index: true
      t.integer :mass
      t.integer :radius

      t.timestamps
    end
  end
end
