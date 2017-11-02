//Sift Through Recipes
$(function() {
  $('.js-next').on('click', function() {
    currentId = parseInt($(".js-next").attr("data-id"))
    nextId = currentId + 1;
    $.get("/recipes/" + nextId + ".json", function(data) {
      insertData(data);
    })

    // change attribute to sift to next recipe
    $(".js-next").attr("data-id", nextId)

    // change href of "See The Items"
    newVal = $(".load_items").attr("href").replace(currentId, nextId)
    $(".load_items").attr("href", newVal)
    $(".load_items").trigger('click');

    // change action of New Item form
    newAction = $(".new_item").attr("action").replace(currentId, nextId)
    $(".new_item").attr("action", newAction)
  })
})

function insertData(data) {
	$(".recipeName").text(data["name"])
	$(".recipeSteps").text(data["steps"])
	$(".recipeTime").text(data["time"])
	$(".recipeCuisine").text(data["cuisine"]["name"])
}

// Render an Index Page
$(function() {
  $(".short_time").on('click', function(e) {
    $(".short_time").off("click");
    $.get("/recipes/short_time", function (data) {
      data.forEach(function(recipe) {
        let oneRecipe = new Recipe(recipe)
        var recipeHTML = oneRecipe.formatLink()
        $(".short_recipes").append(recipeHTML)
      })
    });
    e.preventDefault();
  })
})

// JS Model Object
function Recipe(recipe) {
  this.id = recipe.id
  this.name = recipe.name
  this.steps = recipe.steps
  this.time = recipe.time
}
// Prototype method
Recipe.prototype.formatLink = function() {
  let recipeHTML = `<a href="/recipes/${this.id}" data-id=${this.id}>${this.name}</a><br>`
  return recipeHTML
}
