class GamesController < ApplicationController
  
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      flash[:success] = "Congratulations! Create a review here!"
      redirect_to game_path(@game)
    else
      flash[:notice] = "Please check all fields and try again"
      render :new
    end
    
  end

  def show
    set_game
  end


  private

  def game_params
    params.require(:game).permit(:title, :genre, :platform)
  end

  def set_game
    @game = Game.find_by(id: params[:id])
    redirect_to games_path if !@game #rescue
  end

end
