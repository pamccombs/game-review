class Game < ApplicationRecord

    validates_presence_of :title, :genre, :platform
        validates :title, uniqueness:  { message: "Sorry, that title is already taken." }
    
    has_many :reviews
    has_many :users, through: :reviews
        
    def self.search(query)
        if query.present?
            where('title LIKE ?', "%#{query}%")
        else
            self.all
        end
    end
end
