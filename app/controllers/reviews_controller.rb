class ReviewsController < ApplicationController
  before_action :set_game, only: [:new, :create]
  before_action :set_review, except: [:index, :new, :create, :popular]

  def index
    if !!params[:game_id]
      set_game
      @reviews = @game.reviews
      respond_to do |format|
        format.json {render json: @game}
        format.html
      end
    elsif !!params[:user_id]
      @user = current_user
      @reviews = @user.reviews
      respond_to do |format|
        format.json {render json: @user}
        format.html {render 'index.html', :layout => false }
        format.js {render 'index.js', :layout => false }
      end
    else
      @reviews = Review.all
      respond_to do |format|
        format.json {render json: @reviews}
        format.html
      end
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    

    if @review.save
      respond_to do |format|
        format.json {render json: @review}
        format.html {redirect_to review_path(@review)}
        format.js   {render 'users/users_review', :layout => false}
      flash[:success] = "Review Created!"
      end  
    else
      respond_to do |format|
        format.json { render :json => { :errors => @guide.errors.full_messages }, :status => 422 }
        format.html { render 'reviews/new'}
        format.js   { render 'users/reviews', layout => false}
      flash[:notice] = "Please check all fields and try again"
      end
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

  

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :game_id, :user_id)
  end

  def set_game
    @game = Game.find_by(id: params[:game_id])
    #redirect_to games_path if !params[:game_id]
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
