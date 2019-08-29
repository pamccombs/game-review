class UsersController < ApplicationController
  before_action :set_user, only: [:reviews]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "New User created!"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Please check all fields and try again"
      render :new
    end
  end

  def show
    redirect_if_not_logged_in
    @user = current_user
    @reviews = @user.reviews
    @review = Review.new
    respond_to do |format|
      format.json {render json: @user}
      format.html 
    end
  end

  def reviews
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :admin)
  end

  def set_user
    @user = User.find_by(params[:user_id])
    redirect_to new_user_path if !@user
  end

  # def review_params
  #   params.require(:review).permit(:title, :body, :rating, :game_id, :user_id)
  # end

end
