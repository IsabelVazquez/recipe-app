# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  User has_many Recipes
- [X] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  Recipe belongs_to User
- [X] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  User has_many Cuisines through Recipes
- [X] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  Recipes.name
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  Shown through partial 'layouts/form_errors'
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [X] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
  Recipe/new writes to Cuisine using a custom attribute writer that creates or finds a Cuisine
- [X] Include signup (how e.g. Devise)
- [X] Include login (how e.g. Devise)
- [X] Include logout (how e.g. Devise)
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
  Devise with Facebook
- [X] Include nested resource show or index (URL e.g. users/2/recipes)
  recipes/1/items, no show
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  recipes/1/items/new
- [X] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
