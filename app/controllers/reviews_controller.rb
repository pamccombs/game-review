class ReviewsController < ApplicationController
  
  def index
    if params[:game_id]
      @game = which_game?
      @reviews = @game.reviews
    elsif params[:user_id]
      @user = which_user?
      @reviews = @user.reviews
    else
      @reviews = Review.all
    end

  end

  def new
    @game = which_game?
    @review = Review.new
  end

  def create
    @game = which_game?
    @review = Review.create(review_params)
    flash[:success] = "Congratulations! Here's your review!"
    redirect_to game_review_path(@game, @review)
  end

  def show
    if params[:game_id]
      @game = which_game?
      @review = Review.find(params[:id])
    else
      @review = Review.find(params[:id])
    end
    
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    
    if @review.save
      flash[:success] = "Review updated!"
      redirect_to review_path
    else
      flash[:error]
      redirect_to reviews_path
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:success] = "Review deleted!"
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :game_id, :user_id)
  end

end
