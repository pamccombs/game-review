class Review < ApplicationRecord
    
    validates_presence_of :title, :body, :rating
        validates_inclusion_of :rating, :in => 1..10, :message => "Sorry, the rating must be between 1-10."
        validates :title, length: { maximum: 32 }

        belongs_to :user
        belongs_to :game
        
    #search by rating

    def self.popular
        where(rating: 8..10)
    end

    #scope :popular -> { where(rating: 7..10) }



end
