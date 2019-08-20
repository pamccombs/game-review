class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :user_id, :game_id
  belongs_to :user
  belongs_to :game
end
