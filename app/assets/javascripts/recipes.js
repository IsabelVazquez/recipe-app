$(function() {
  $("a.load_items").on("click", function(e) {
    $.ajax({
      url: this.href,
      dataType: 'script'
    })

    return false;
  })
})

$(function() {
  $("a.new_items").on("click", function(e) {
    $.ajax({
      url: this.href,
      dataType: 'script'
    })

    e.preventDefault();
  })
})

// Submitting Item via AJAX POST request
$(function() {
  $("#new_item").on("submit", function(e){
    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        $("#item_name").val("");
        $("#item_quantity").val("");
        $("#item_measurement").val("");
        var $ol = $("div.items");
        $ol.append(response);
      },
    });
    e.preventDefault();
  })
})

//Sift Through Recipes
$(function() {
  $('.js-next').on('click', function() {
    currentId = parseInt($(".js-next").attr("data-id"))
    nextId = currentId + 1;
    $.get("/recipes/" + nextId + ".json", function(data) {
      insertData(data);
    })
  })
})

function insertData(data) {
	$(".recipeName").text(data["name"])
	$(".recipeSteps").text(data["steps"])
	$(".recipeTime").text(data["time"])
	$(".recipeCuisine").text(data["cuisine"]["name"])
}
