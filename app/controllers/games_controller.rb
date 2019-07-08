class GamesController < ApplicationController
  
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    redirect_to game_path(@game)
    flash[:success] = "Congratulations! Create a review here!"
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
