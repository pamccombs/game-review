class Review < ApplicationRecord
    
    validates_presence_of :title, :body, :rating
        validates_inclusion_of :rating, :in => 1..10, :message => " - Sorry, the rating must be between 1-10."
        validates :title, length: { maximum: 32 }

        belongs_to :user
        belongs_to :game
        
    #def self.popular
        #where(rating: 8..10).order('rating DESC')
    #end

    scope :popular, -> { where(rating: 8..10).order('rating DESC') }

    def avg_rating
        total = 0
        self.each do |review|
            total += review.rating
        end
        avg = total.to_f/self.reviews.length
        avg.round(1)
    end

    

end
