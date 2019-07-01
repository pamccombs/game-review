# Specifications for the Rails Assessment

-Game Tracker

  -Models
    
    -User
      -:display_name
      -:email
      -:password_digest
      -:admin

    -Review
      -:user_id
      -:game_id
      -:rating
      -#Games.top_ratings_by_genre()

    -Game
      -:title
      -:rating(1-10) 
        -validates :rating, :inclusion => 1..10
      -#Genre.find_by(game_id)
      -#self.top_ratings
  


Specs:
- [x] Using Ruby on Rails for the project
- [ ] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 

Genre has_many Games

- [ ] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

Game belongs_to Genre

- [ ] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

User has_many Games through Genres
Games has_many Users through Genres

- [ ] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

User has_many Games through Genres
Games has_many Users through Genres

- [ ] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

genre.quantity(keep track of how many games belong to genre)

- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

User must have name
User must have email
Game must have title
Genre must have name

- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

top_ratings, in game table


- [ ] Include signup (how e.g. bcrypt)
- [ ] Include login (how e.g. bcrypt)
- [ ] Include logout (how e.g. bcrypt)


- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)

Use GitHub OAuth

- [ ] Include nested resource show or index (URL e.g. users/2/recipes)

genres/1/games/10

- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)

genres/1/games/new

- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Flash error

Confirm:
- [ ] The application is pretty DRY

refactor

- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
