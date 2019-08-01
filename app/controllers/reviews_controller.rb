class ReviewsController < ApplicationController
  before_action :set_game, only: [:new]
  before_action :set_review, except: [:index, :new, :create, :popular]

  def index
    if !!params[:game_id]
      set_game
      @reviews = @game.reviews
    elsif !!params[:user_id]
      @user = current_user
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
    @game = @review.game
  end

  def update
    @review.update(review_params)
    if @review.save
      flash[:success] = "Review updated!"
      redirect_to review_path(@review)
    else
      flash[:notice] = "Please check all fields and try again"
      render :new
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

  def avgrating
    @reviews = Review.all
    
    
    
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :game_id, :user_id)
  end

  def set_game
    @game = Game.find_by(id: params[:game_id])
    redirect_to games_path if !params[:game_id]
  end

  def set_review
    @review = Review.find_by(id: params[:id])
    redirect_to reviews_path if !params[:id]
  end

  def set_game_and_review
    set_game
    set_review
  end

end
