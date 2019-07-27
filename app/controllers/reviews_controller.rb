class ReviewsController < ApplicationController
  
  def index
    if params[:game_id]
      @game = which_game?
      @reviews = @game.reviews
    elsif params[:user_id]
      #For future functionality for all users not just current_user
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
    if params[:game_id]
      which_game_and_review?
    elsif params[:game_id]
      @review = which_review?
    end
    
  end

  def edit
    if params[:game_id]
      which_game_and_review?

    elsif params[:game_id]
      @review = which_review?
    end
  end

  def update
    #for game/review path
    if params[:game_id]
      which_game_and_review?
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

    #for review path
    elsif params[:id]
      @review = which_review?
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
  end

  def destroy
    @review = which_review?
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

  def which_game?
    game = Game.find(params[:game_id])
    return game
  end

  def which_review?
    review = Review.find(params[:id])
  end

  def which_user?
    user = User.find(params[:user_id])
    return user
  end

  def which_game_and_review?
    @game = which_game?
    @review = which_review?
  end

end
