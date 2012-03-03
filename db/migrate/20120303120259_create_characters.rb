class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :char_name
      t.integer :char_experience
      t.integer :char_race
      t.integer :char_class
      t.references :user

      t.timestamps
    end
    add_index :characters, :user_id
  end
end
