class ModifyColumnInCharacterTableToEnum < ActiveRecord::Migration
  def up
    change_column :characters, :char_race, :string 
     change_column :characters, :char_class, :string 
  end

  def down
       change_column :characters, :char_race, :integer 
     change_column :characters, :char_class, :integer 
  end
end
