class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates_uniqueness_of :user_id, scope: :game_id
end
