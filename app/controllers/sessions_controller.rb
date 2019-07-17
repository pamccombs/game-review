class SessionsController < ApplicationController
  
  def new
  end

  
  def create
    if request.env["omniauth.auth"]
      auth = request.env["omniauth.auth"]
      @user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
      session[:user_id] = user.id
      flash[:success] = "Welcome to the Game Review!"
      redirect_to user_path(@user)
    else
      @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        flash[:success] = "Welcome to the Game Review!"
        redirect_to user_path(@user)
        else
        @user = User.new
        flash[:notice] = "User not found, Please try again."
        redirect_to new_user_path
      end
    end
  end


  def destroy
    session.delete :user_id
    redirect_to root_path :notice => "Signed out!"
  end
end
