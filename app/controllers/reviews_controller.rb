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
    notice_and_path
  end

  def show
    if params[:game_id]
      which_game_and_review?
    else
      @review = which_review?
    end
    
  end

  def edit
    if params[:game_id]
      which_game_and_review?
    else
      @review = which_review?
    end
  end

  def update
    if params[:game_id]
      which_game_and_review?
      @review.update(review_params)
      notice_and_path
    else
      @review = which_review?
      @review.update(review_params)
      notice_and_path
    end
  end

  def destroy
    @review = which_review?
    @review.destroy
    flash[:success] = "Review deleted!"
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :game_id, :user_id)
  end

end
