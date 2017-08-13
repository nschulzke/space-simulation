class CreateOrbits < ActiveRecord::Migration[5.1]
  def change
    create_table :orbits do |t|
      t.references :orbitable, polymorphic: true, index: true
      t.decimal :mass
      t.decimal :radius

      t.timestamps
    end
  end
end
