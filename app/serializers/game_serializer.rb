class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :cover, :year
end
