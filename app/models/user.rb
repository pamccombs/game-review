class User < ApplicationRecord
  
    validates_presence_of :username, :email
        validates :username, uniqueness:  { message: "Sorry, that username is already taken." }
        validates :email, uniqueness: { message: "That email already has an account, did you mean to login?" }

    has_secure_password
    has_many :reviews
    has_many :games, through: :reviews

    def has_reviews?
        @user.reviews
    end
end
