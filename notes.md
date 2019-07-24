# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 

review has_many Games

- [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

Game belongs_to review

- [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

User has_many Games through reviews
Games has_many Users through reviews

- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

User has_many Games through reviews
Games has_many Users through reviews

- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

reviews.rating

- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

User must have name
User must have email
Game must have title
Genre must have name

- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

popular, in review table


- [X] Include signup (how e.g. bcrypt)
- [X] Include login (how e.g. bcrypt)
- [X] Include logout (how e.g. bcrypt)


- [X] Include third party signup/login (how e.g. Devise/OmniAuth)

Use GitHub OAuth

- [X] Include nested resource show or index (URL e.g. users/2/recipes)

reviews/1/games/10

- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)

reviews/1/games/new

- [X] Include form display of validation errors (form URL e.g. /recipes/new)

Flash error

Confirm:
- [X] The application is pretty DRY

refactor

- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate
