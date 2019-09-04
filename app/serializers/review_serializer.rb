class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :user_id, :game_id, :game, :rating
  belongs_to :user
  belongs_to :game

  def game
    {game_title: self.object.game.title}
  end 

end
