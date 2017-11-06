//Sift Through Recipes
$(function() {
  $('.js-next').on('click', function() {
    const currentId = parseInt($(".js-next").attr("data-id"))
    const nextId = currentId + 1;
    $.get("/recipes/" + nextId + ".json", function(recipeJSON) {
      const recipe = new Recipe(recipeJSON);
      recipe.renderNext()
    })

    //empty previous recipe's items, old + new
    $(".items").html("")
    $(".newItem").html("")

    // change attribute to sift to next recipe
    $(".js-next").attr("data-id", nextId)

    // change href of recipeName
    $(".recipeName").attr("href", `/recipes/${nextId}`)

    // change href of "See The Items"
    $(".load_items").attr("href", `${nextId}/items`)

    // change action of New Item form
    const newAction = $(".new_item").attr("action").replace(currentId, nextId)
    $(".new_item").attr("action", newAction)

    // change href of "Edit Recipe"
    const newHref = $(".edit_recipe").attr("href").replace(currentId, nextId)
    $(".edit_recipe").attr("href", newHref)
  })
})

// Render an Index Page
$(function() {
  $(".short_time").on('click', function(e) {
    $.get(this.href, function (recipes) {
      recipes.forEach(function(recipe) {
        let oneRecipe = new Recipe(recipe)
        var recipeHTML = oneRecipe.formatLink()
        $(".short_recipes").append(recipeHTML)
      })
    });
    // to prevent multiple renderings
    $("a.short_time").attr("href", "");
    e.preventDefault();
  })
})

// JS Constructor - creates a Recipe object
function Recipe(attributes) {
  this.id = attributes.id
  this.name = attributes.name
  this.steps = attributes.steps
  this.time = attributes.time
  this.cuisine = attributes.cuisine
}
// Prototype methods
Recipe.prototype.formatLink = function() {
  let recipeHTML = `<a href="/recipes/${this.id}" data-id=${this.id}>${this.name}</a><br>`
  return recipeHTML
}

Recipe.prototype.renderNext = function() {
	$(".recipeName").text(this.name)
	$(".recipeSteps").text(this.steps)
	$(".recipeTime").text(this.time)
	$(".recipeCuisine").text(this.cuisine.name)
}
