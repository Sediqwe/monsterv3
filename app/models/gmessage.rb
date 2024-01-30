class Gmessage < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_rich_text :desc
end
