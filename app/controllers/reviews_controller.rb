class ReviewsController < ApplicationController
  
  def index
    @game = which_game?
    @reviews = @game.reviews
  end

  def new
    @game = which_game?
    @review = Review.new
  end

  def create
    @game = which_game?
    @review = Review.create(review_params)
    redirect_to game_review_path(@game, @review)
  end

  def show
    @game = which_game?
    @review = Review.find(params[:id])
  end

  def edit
    @game = which_game?
    @review = Review.find(params[:id])
    redirect_to game_review_path(@game, @review)
  end

  def update
    @game = which_game?
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to game_review_path(@game, @review)
  end

  def destroy
    @review = Review.find(params[:id])
    @game = which_game?
    @review.destroy
    redirect_to game_path(@game)
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :game_id, :user_id)
  end

end
