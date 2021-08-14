class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates_uniqueness_of :user_id, scope: :game_id

  scope :to_delete, ->(user_id, game_id) { where('user_id = ? AND game_id = ?', user_id, game_id) }
end
