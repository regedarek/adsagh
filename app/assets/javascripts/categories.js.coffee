$ ->
  $(".nested_categories").hide()
  $(".depth-0").click ->
    $(".description").hide()
    $(".nested_categories").hide()
    $(".depth-0").css color: 'black'

    $(this).css color: 'red'
    root = $(this).attr("class").split(" ")[2]
    $("." + root).show()
