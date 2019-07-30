class ReviewsController < ApplicationController
  before_action :set_game, only: [:new, :create] 
  before_action :set_review, except: [:index, :new, :create]

  def index
    if params[:game_id]
      set_game
      @reviews = @game.reviews
    elsif params[:user_id]
      #For future functionality for all users not just current_user
      set_user
      @reviews = @user.reviews
    else
      @reviews = Review.all
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:success] = "Review Created!"
      redirect_to review_path(@review)
    else
      flash[:notice] = "Please check all fields and try again"
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    @review.update(review_params)
    
    if @review
      if @review.save
        flash[:success] = "Review updated!"
        redirect_to review_path(@review)
      else
        flash[:notice] = "Please check all fields and try again"
        render :new
      end
    end
  end

  def destroy
    @review.destroy
    flash[:success] = "Review deleted!"
    redirect_to reviews_path
  end

  def popular
    @popular = Review.popular
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :game_id, :user_id)
  end

  def set_game
    @game = Game.find_by(params[:game_id])
    redirect_to games_path if !@game #rescue
  end

  def set_review
    @review = Review.find_by(params[:id])
    redirect_to reviews_path if !@review
  end

  def set_user
    @user = User.find_by(params[:user_id])
    redirect_to new_user_path if !@user
  end

  def set_game_and_review
    set_game
    set_review
  end

end
