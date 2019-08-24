class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :user_id, :game_id, :game
  belongs_to :user
  belongs_to :game

  def game
    {game_title: self.object.game.title}
  end 

  #def review
    #{review_link: self.object.review.}
  #end

end
