class CreateStars < ActiveRecord::Migration[5.1]
  def change
    create_table :stars do |t|
      t.integer :mass

      t.timestamps
    end
  end
end
