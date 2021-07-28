class Game < ApplicationRecord
  has_many :favourites
  validates_presence_of :title
end
