class GamesController < ApplicationController
  
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    notice_and_path
  end

  def show
    @game = Game.find(params[:id])
    @review = Review.new
  end


  private

  def game_params
    params.require(:game).permit(:title, :genre, :platform)
  end

end
