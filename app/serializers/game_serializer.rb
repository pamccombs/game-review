class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :platform
  has_many :reviews
end
