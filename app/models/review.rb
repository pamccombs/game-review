class Review < ApplicationRecord
    
    validates_presence_of :title, :body, :rating
        validates_inclusion_of :rating, :in => 1..10, :message => "Sorry, the rating must be between 1-10."
        validates :title, length: { maximum: 32 }

        belongs_to :user
        belongs_to :game
        
    #search by rating

end
