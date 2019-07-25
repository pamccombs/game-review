class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :redirect_if_not_logged_in
    

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

    def notice_and_path
        if @review
            if @review.save
                flash[:success] = "Review updated!"
                redirect_to review_path(@review)
              else
                flash[:notice] = "Please check all fields and try again"
                redirect_to reviews_path
            end
        end
    end

   
    
end
