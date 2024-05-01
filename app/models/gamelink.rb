class Gamelink < ApplicationRecord
  belongs_to :game
  belongs_to :linktype
end
