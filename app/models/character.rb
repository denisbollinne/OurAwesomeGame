class Character < ActiveRecord::Base
  belongs_to :user
  
  enum_attr :char_race, %w(Human Elf Orc)
  enum_attr :char_class, %w(Assassin Barbarian Warrior)
end
