class CreatePosition < ActiveRecord::Migration
   def change
    create_table :positions do |t|
      t.string :pos_direction
      t.integer :pos_x
      t.integer :pos_y
      t.datetime :pos_changed_date
      t.references :character

      t.timestamps
    end
    add_index :positions, :character_id
  end
end
