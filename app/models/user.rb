class User < ApplicationRecord
  
    validates_presence_of :username, :email
        validates :username, uniqueness:  { message: "Sorry, that username is already taken." }
        validates :email, uniqueness: { message: "That email already has an account, did you mean to login?" }

    has_secure_password
    has_many :reviews
    has_many :games, through: :reviews

    
 
    def self.create_with_omniauth(auth)
        oauth_name = auth["info"]["nickname"]
        if @user = User.find_by(:username => oauth_name)
          return @user
        else
          @user = User.create(:username => oauth_name, :email => SecureRandom.hex, :password => SecureRandom.hex)
          return @user
        end
    end
        
    

    def has_reviews?
        @user.reviews
    end
end
