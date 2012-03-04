class Position < ActiveRecord::Base
  belongs_to :character
  enum_attr :pos_direction, %w(None Up Right Down Left)
end
