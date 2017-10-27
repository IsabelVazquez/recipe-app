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
