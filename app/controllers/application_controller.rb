class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :redirect_if_not_logged_in, :which_user?, :which_game?, :which_review?

    def home
        
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect_to root_path if !logged_in?
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

    
end
