class GamesController < ApplicationController
  
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)

    if @game.save
      flash[:success] = "Congratulations! Create a review here!"
      redirect_to game_path(@game)
    else
      flash[:notice] = "Please check all fields and try again"
      redirect_to new_game_path
    end
    
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
