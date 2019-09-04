class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :platform, :avg_rating
  has_many :reviews
end
