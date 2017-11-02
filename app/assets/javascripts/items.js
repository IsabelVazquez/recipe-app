$(function() {
  $("a.load_items").on("click", function(e) {
    $.get(this.href, function (data) {
      data.forEach(function(item) {
        let oneItem = new Item(item)
        var itemHTML = oneItem.formatItem()
        $(".items").append(itemHTML)
      })
    });
    // to prevent multiple renderings
    // $("a.load_items").attr("href", "");
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
  let itemHTML = `<li data-id=${this.id}>${this.quantity} ${this.measurement} - ${this.name}</li>`
  return itemHTML
}

// Submitting Item via Rails API
$(function() {
  $(".new_item").on("submit", function(e){
    $.post(this.action, $(this).serialize(), function(item) {
      let $ol = $(".newItem");
      let newItem = new Item(item);
      let itemHTML = newItem.formatItem();
      $ol.append(itemHTML);
      // clean fields
      $("#item_name").val("");
      $("#item_quantity").val("");
      $("#item_measurement").val("");
    });
    // $.ajax({
    //   type: ($("input[name='_method']").val() || this.method),
    //   url: this.action,
    //   data: $(this).serialize(),
    //   success: function(response){
    //     $("#item_name").val("");
    //     $("#item_quantity").val("");
    //     $("#item_measurement").val("");
    //     var $ol = $("div.items");
    //     $ol.append(response);
    //   },
    // });
    e.preventDefault();
  })
})
