class Gmessage < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :gmessage  
  has_rich_text :desc
end
