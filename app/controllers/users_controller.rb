class UsersController < ApplicationController
  
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
    @user = User.find(params[:id])
  end

  def reviews
    @user = User.find(params[:id])
    #render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :admin)
  end

end
