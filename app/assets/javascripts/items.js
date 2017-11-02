$(function() {
  $("a.load_items").on("click", function(e) {
    $.get(this.href, function (data) {
      data.forEach(function(item) {
        let oneItem = new Item(item)
        var recipeHTML = oneItem.formatItem()
        $(".items").append(recipeHTML)
      })
    });
    e.preventDefault();
  })
})

// JS Model Object
function Item(item) {
  this.id = item.id
  this.name = item.name
  this.measurement = item.measurement
  this.quantity = item.quantity
}
// Prototype method
Item.prototype.formatItem = function() {
  let recipeHTML = `<li data-id=${this.id}>${this.quantity} ${this.measurement} - ${this.name}</li>`
  return recipeHTML
}

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
